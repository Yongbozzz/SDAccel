#!/usr/bin/env bash
set -euo pipefail

# 语料（corpus）需预先放入 server 挂载目录 workspace/hsgm_corpus（各 case 目录名独占、
# 不冲突，本脚本只校验+计数，不重复拷贝）。OKF bundle 的挂载目录 okf_bundle_by_opus4.8
# 是所有 case 全局共享的（server 端 ECRAG_OKF_BUNDLE_PATH 固定，一次只能有一个 case 的
# bundle 在位），会被其它 case（如 qingyun）覆盖，故每次运行都从本 case 源重新拷贝，
# 避免用到残留的别的 case 的概念图。然后重建 KB、摄入语料并激活完整的 ChatQnA pipeline。

API_BASE="http://localhost:16010"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/../.." && pwd)"
UI_SERVICE_PORT="${UI_SERVICE_PORT:-8082}"
CONFIG_DIR="$SCRIPT_DIR/hybrid_search_config_for_container"
LOCAL_PIPELINE_CONFIG="$CONFIG_DIR/test_pipeline_hybrid_rerank_vllm_local.json"
REMOTE_PIPELINE_CONFIG="$CONFIG_DIR/test_pipeline_hybrid_rerank_vllm.json"
PIPELINE_MODE="local"
LLM_MODEL="${LLM_MODEL:-Qwen/Qwen3.6-35B-A3B}"

if (($# > 1)); then
  echo "用法：bash $0 [--remote-vllm]" >&2
  exit 2
fi

case "${1:-}" in
  "")
    PIPELINE_CONFIG="$LOCAL_PIPELINE_CONFIG"
    ;;
  --remote-vllm)
    PIPELINE_MODE="remote"
    PIPELINE_CONFIG="$REMOTE_PIPELINE_CONFIG"
    ;;
  *)
    echo "未知参数：$1" >&2
    echo "用法：bash $0 [--remote-vllm]" >&2
    exit 2
    ;;
esac

UI_CACHE_HOST_DIR="${HSGM_UI_DIRECTORY:-$REPO_ROOT/workspace}"
CORPUS_STAGE_NAME="hsgm_corpus"
CORPUS_STAGE_DIR="$UI_CACHE_HOST_DIR/$CORPUS_STAGE_NAME"
# 本 case 的 OKF bundle 源（全局共享 staging 每次从此刷新）。
OKF_BUNDLE_SOURCE="${HSGM_OKF_BUNDLE:-$SCRIPT_DIR/dataset/okf_bundle}"
OKF_STAGE_DIR="$UI_CACHE_HOST_DIR/okf_bundle_by_opus4.8"
VLLM_ENDPOINT=$(jq -er '.generator[0].vllm_endpoint' "$PIPELINE_CONFIG")
VLLM_HOST="${VLLM_ENDPOINT#*://}"
VLLM_HOST="${VLLM_HOST%%:*}"
VLLM_WARMUP_ENDPOINT="${VLLM_WARMUP_ENDPOINT:-http://localhost:41091}"
VLLM_WARMUP_ENDPOINT="${VLLM_WARMUP_ENDPOINT%/}"
DATABASE_HEALTH_ENDPOINT="http://milvus-standalone:9091/healthz"
GRAPH_DATABASE_HEALTH_ENDPOINT="http://localhost:19669/status"
NEBULA_STORAGE_HOST="${NEBULA_STORAGE_HOST:-nebula-storaged0}"
NEBULA_STORAGE_PORT="${NEBULA_STORAGE_PORT:-9779}"
WAIT_TIMEOUT_SECONDS="${WAIT_TIMEOUT_SECONDS:-600}"
WAIT_INTERVAL_SECONDS="${WAIT_INTERVAL_SECONDS:-5}"
INGEST_TIMEOUT_SECONDS="${INGEST_TIMEOUT_SECONDS:-10800}"
WARMUP_TIMEOUT_SECONDS="${WARMUP_TIMEOUT_SECONDS:-3600}"
EXPECTED_DOCUMENT_COUNT=0
EXPECTED_CONCEPT_COUNT=0
KB_NAME="ut_hsgm_container"
PIPELINE_NAME="ut_hsgm_container_chatqna"
PREVIOUS_KB_NAME="ut_qingyun_container"
PREVIOUS_PIPELINE_NAME="ut_qingyun_container_chatqna"
PIPELINE_PAYLOAD="$PIPELINE_CONFIG"

if [[ "$PIPELINE_MODE" == "local" ]]; then
  if [[ "$(docker container inspect --format '{{.State.Running}}' "$VLLM_HOST" 2>/dev/null || true)" != "true" ]]; then
    echo "本地 vLLM 容器 $VLLM_HOST 未运行，请先启动该容器（服务地址：$VLLM_ENDPOINT）" >&2
    exit 1
  fi
  PIPELINE_PAYLOAD=$(mktemp)
  trap 'rm -f -- "$PIPELINE_PAYLOAD"' EXIT
  jq -e \
    --arg model_id "$LLM_MODEL" \
    --arg model_path "/home/user/models/$LLM_MODEL" '
    if .generator[0].model.model_id == "__LLM_MODEL__" and
       .generator[0].model.model_path == "__LLM_MODEL_PATH__" then
      .generator[0].model.model_id = $model_id |
      .generator[0].model.model_path = $model_path
    else
      error("local pipeline model placeholders are missing")
    end
  ' "$PIPELINE_CONFIG" > "$PIPELINE_PAYLOAD"
fi

if ! [[ "$WAIT_TIMEOUT_SECONDS" =~ ^[1-9][0-9]*$ && \
  "$WAIT_INTERVAL_SECONDS" =~ ^[1-9][0-9]*$ && \
  "$INGEST_TIMEOUT_SECONDS" =~ ^[1-9][0-9]*$ && \
  "$WARMUP_TIMEOUT_SECONDS" =~ ^[1-9][0-9]*$ ]]; then
  echo "WAIT_TIMEOUT_SECONDS、WAIT_INTERVAL_SECONDS、INGEST_TIMEOUT_SECONDS 和 WARMUP_TIMEOUT_SECONDS 必须是正整数" >&2
  exit 2
fi

wait_for_dependency() {
  local name="$1"
  local url="$2"
  local deadline=$((SECONDS + WAIT_TIMEOUT_SECONDS))

  echo "等待 $name 就绪：$url（超时 ${WAIT_TIMEOUT_SECONDS}s）"
  until docker exec edgecraftrag-server curl --noproxy "*" --fail --silent \
    --connect-timeout 2 --max-time 5 "$url" >/dev/null 2>&1; do
    if ((SECONDS >= deadline)); then
      echo "等待 $name 超时：$url" >&2
      return 1
    fi
    echo "$name 尚未就绪，${WAIT_INTERVAL_SECONDS}s 后重试..."
    sleep "$WAIT_INTERVAL_SECONDS"
  done
  echo "$name 已就绪"
}

warm_up_vllm() {
  local models model payload response answer
  local started=$SECONDS

  echo "直接预热 vLLM：$VLLM_WARMUP_ENDPOINT/v1/chat/completions（请求超时 ${WARMUP_TIMEOUT_SECONDS}s）"

  if ! models=$(curl --noproxy "*" --fail-with-body --silent --show-error \
    --connect-timeout 10 --max-time 60 \
    "$VLLM_WARMUP_ENDPOINT/v1/models"); then
    printf '获取 vLLM 模型失败：\n%s\n' "$models" >&2
    return 1
  fi

  if ! model=$(jq -er '.data[0].id | select(type == "string" and length > 0)' <<<"$models"); then
    printf 'vLLM 未返回可用模型：\n%s\n' "$models" >&2
    return 1
  fi

  if ! payload=$(jq -cn --arg model "$model" '{"model": $model, "messages": [{"role": "user", "content": "hi"}], "stream": false, "temperature": 0, "max_tokens": 64, "chat_template_kwargs": {"enable_thinking": false}}'); then
    printf '构造 vLLM 预热请求 JSON 失败，请检查 jq 命令是否完整\n' >&2
    return 1
  fi

  if ! response=$(curl --noproxy "*" --fail-with-body --silent --show-error \
    --connect-timeout 10 --max-time "$WARMUP_TIMEOUT_SECONDS" \
    -X POST "$VLLM_WARMUP_ENDPOINT/v1/chat/completions" \
    -H "Content-Type: application/json" -d "$payload"); then
    printf 'vLLM 预热请求失败：\n%s\n' "$response" >&2
    return 1
  fi

  if ! answer=$(jq -er 'select(.error == null) | .choices[0].message.content | select(type == "string" and test("\\S"))' <<<"$response"); then
    printf 'vLLM 预热没有返回有效回答：\n%s\n' "$response" >&2
    return 1
  fi

  printf 'vLLM 预热成功：model=%s，耗时=%ss\n回答：%s\n' \
    "$model" "$((SECONDS - started))" "$answer"
}

check_staged_case() {
  # corpus 由外部一次性放入挂载目录（各 case 独占、不冲突），只校验+计数、不重复拷贝。
  test -d "$CORPUS_STAGE_DIR"
  # OKF bundle 的挂载目录全局共享、会被其它 case 覆盖，故每次都从本 case 源重新拷贝。
  test -d "$OKF_BUNDLE_SOURCE"
  test -f "$OKF_BUNDLE_SOURCE/index.md"
  rm -rf -- "$OKF_STAGE_DIR"
  cp -a -- "$OKF_BUNDLE_SOURCE" "$OKF_STAGE_DIR"

  EXPECTED_DOCUMENT_COUNT=$(find "$CORPUS_STAGE_DIR" -type f \( -name '*.md' -o -name '*.txt' \) | wc -l)
  EXPECTED_CONCEPT_COUNT=$(find "$OKF_STAGE_DIR" -type f -name '*.md' ! -name 'index.md' | wc -l)

  if ((EXPECTED_DOCUMENT_COUNT == 0)); then
    echo "挂载目录无可摄入语料：$CORPUS_STAGE_DIR" >&2
    return 1
  fi
  echo "case 就绪：${EXPECTED_DOCUMENT_COUNT} 个文档（挂载），${EXPECTED_CONCEPT_COUNT} 个 OKF 概念（已刷新）"
}

verify_ingestion() {
  local actual_document_count
  local actual_concept_count

  actual_document_count=$(curl --noproxy "*" --fail-with-body --silent --show-error --max-time 60 \
    "$API_BASE/v1/knowledge/$KB_NAME/filemap?page_num=1&page_size=1" | jq -er '.total')
  if [[ "$actual_document_count" != "$EXPECTED_DOCUMENT_COUNT" ]]; then
    echo "语料摄入不完整：期望 $EXPECTED_DOCUMENT_COUNT 个文件，实际 $actual_document_count 个" >&2
    return 1
  fi
  # 概念完整性以“图里的 OKF 概念节点数”为准（每个 OKF 文件对应一个概念节点）。
  # 不要用 Milvus 的 ${KB_NAME}_concept collection：它存的是从语料抽取的细粒度概念
  # mention 向量（= seed_concept + OKF 概念，数量远大于 OKF 文件数），粒度不对等。
  actual_concept_count=$(nebula_query \
    "USE $KB_NAME; MATCH (n) WHERE id(n) CONTAINS \"/\" RETURN count(n) AS concept_count" \
    | jq -er '.[0].concept_count')
  if [[ "$actual_concept_count" != "$EXPECTED_CONCEPT_COUNT" ]]; then
    echo "OKF 概念图节点摄入不完整：期望 $EXPECTED_CONCEPT_COUNT，实际 ${actual_concept_count:-0}" >&2
    return 1
  fi
  echo "摄入完整性检查通过：文件 $actual_document_count/$EXPECTED_DOCUMENT_COUNT，概念 $actual_concept_count/$EXPECTED_CONCEPT_COUNT"
}

nebula_query() {
  local query="$1"

  docker exec -i edgecraftrag-server python3 - "$query" <<'PY'
import json
import sys
from nebula3.Config import Config
from nebula3.gclient.net import ConnectionPool

config = Config()
config.timeout = 5000
pool = ConnectionPool()
try:
    if not pool.init([("127.0.0.1", 9669)], config):
        raise RuntimeError("Cannot connect to local Nebula graphd")
    with pool.session_context("root", "nebula") as session:
        result = session.execute(sys.argv[1])
        if not result.is_succeeded():
            raise RuntimeError(result.error_msg())
        rows = [
            dict(zip(result.keys(), (value.cast() for value in result.row_values(index))))
            for index in range(result.row_size())
        ]
        print(json.dumps(rows))
finally:
    pool.close()
PY
}

ensure_nebula_storage() {
  local hosts
  local deadline=$((SECONDS + WAIT_TIMEOUT_SECONDS))

  hosts=$(nebula_query "SHOW HOSTS")
  if ! jq -e --arg host "$NEBULA_STORAGE_HOST" --argjson port "$NEBULA_STORAGE_PORT" \
    'any(.[]; .Host == $host and .Port == $port)' <<<"$hosts" >/dev/null; then
    echo "注册 Nebula storage：$NEBULA_STORAGE_HOST:$NEBULA_STORAGE_PORT"
    nebula_query \
      "ADD HOSTS \"$NEBULA_STORAGE_HOST\":$NEBULA_STORAGE_PORT" >/dev/null
  fi

  echo "等待 Nebula storage ONLINE（超时 ${WAIT_TIMEOUT_SECONDS}s）"
  while true; do
    hosts=$(nebula_query "SHOW HOSTS")
    if jq -e --arg host "$NEBULA_STORAGE_HOST" --argjson port "$NEBULA_STORAGE_PORT" \
      'any(.[]; .Host == $host and .Port == $port and .Status == "ONLINE")' <<<"$hosts" >/dev/null; then
      echo "Nebula storage 已就绪"
      return 0
    fi
    if ((SECONDS >= deadline)); then
      echo "等待 Nebula storage ONLINE 超时" >&2
      return 1
    fi
    echo "Nebula storage 尚未 ONLINE，${WAIT_INTERVAL_SECONDS}s 后重试..."
    sleep "$WAIT_INTERVAL_SECONDS"
  done
}

echo "==================== 1) 检查并预热 vLLM、检查数据库 ===================="
WAIT_TIMEOUT_SECONDS=1200 wait_for_dependency "vLLM" "$VLLM_ENDPOINT/v1/models"
warm_up_vllm
wait_for_dependency "Milvus" "$DATABASE_HEALTH_ENDPOINT"
wait_for_dependency "Nebula Graph" "$GRAPH_DATABASE_HEALTH_ENDPOINT"
ensure_nebula_storage

echo "==================== 2) 校验挂载的 case 并检查 server ===================="
check_staged_case
docker exec edgecraftrag-server test -d "/home/user/ui_cache/$CORPUS_STAGE_NAME"
docker exec edgecraftrag-server test -f /home/user/ui_cache/okf_bundle_by_opus4.8/index.md
wait_for_dependency "EdgeCraftRAG API" "$API_BASE/v1/knowledge"

echo "==================== 3) 删除旧测试资源 ===================="
curl --noproxy "*" --silent --show-error --max-time 900 \
  -X PATCH \
  "$API_BASE/v1/settings/pipelines/$PREVIOUS_PIPELINE_NAME" \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"$PREVIOUS_PIPELINE_NAME\",\"active\":false}"
echo

curl --noproxy "*" --silent --show-error --max-time 900 \
  -X PATCH \
  "$API_BASE/v1/knowledge/patch" \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"$PREVIOUS_KB_NAME\",\"active\":false}"
echo

curl --noproxy "*" --silent --show-error --max-time 900 \
  -X PATCH \
  "$API_BASE/v1/settings/pipelines/$PIPELINE_NAME" \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"$PIPELINE_NAME\",\"active\":false}"
echo

curl --noproxy "*" --silent --show-error --max-time 900 \
  -X DELETE \
  "$API_BASE/v1/settings/pipelines/$PIPELINE_NAME"
echo

curl --noproxy "*" --silent --show-error --max-time 900 \
  -X PATCH \
  "$API_BASE/v1/knowledge/patch" \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"$KB_NAME\",\"active\":false}"
echo

curl --noproxy "*" --silent --show-error --max-time 900 \
  -X DELETE \
  "$API_BASE/v1/knowledge/$KB_NAME"
echo

echo "==================== 4) 创建 fusion KB ===================="
curl --noproxy "*" --fail-with-body --silent --show-error --max-time "$INGEST_TIMEOUT_SECONDS" \
  -X POST \
  "$API_BASE/v1/knowledge" \
  -H "Content-Type: application/json" \
  -d @"$CONFIG_DIR/test_kb_fusion.json"
echo

echo "==================== 5) 摄入语料 ===================="
curl --noproxy "*" --fail-with-body --silent --show-error --max-time "$INGEST_TIMEOUT_SECONDS" \
  -X POST \
  "$API_BASE/v1/knowledge/$KB_NAME/files" \
  -H "Content-Type: application/json" \
  -d "{\"local_path\":\"$CORPUS_STAGE_NAME\"}"
echo
verify_ingestion

echo "==================== 6) 激活 KB ===================="
curl --noproxy "*" --fail-with-body --silent --show-error --max-time "$INGEST_TIMEOUT_SECONDS" \
  -X PATCH \
  "$API_BASE/v1/knowledge/patch" \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"$KB_NAME\",\"active\":true}"
echo

echo "==================== 7) 创建并激活 hybrid + reranker + vLLM pipeline ($PIPELINE_MODE) ===================="
curl --noproxy "*" --fail-with-body --silent --show-error --max-time "$INGEST_TIMEOUT_SECONDS" \
  -X POST \
  "$API_BASE/v1/settings/pipelines" \
  -H "Content-Type: application/json" \
  -d @"$PIPELINE_PAYLOAD"
echo

# 检索 / ChatQnA / 图谱等手动测试已移至 retrieval_test.sh（可直接复制粘贴的 curl）。

echo "==================== 全部完成 ===================="
