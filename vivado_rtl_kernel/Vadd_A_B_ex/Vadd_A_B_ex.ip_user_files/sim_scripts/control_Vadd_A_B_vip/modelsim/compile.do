vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_5

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_5 modelsim_lib/msim/axi_vip_v1_1_5

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_5 -L xilinx_vip "+incdir+/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"/home/lzc/document/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../ipstatic/hdl" "+incdir+/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../Vadd_A_B_ex.srcs/sources_1/ip/control_Vadd_A_B_vip/sim/control_Vadd_A_B_vip_pkg.sv" \

vlog -work axi_vip_v1_1_5 -64 -incr -sv -L axi_vip_v1_1_5 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/home/lzc/document/Xilinx/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../Vadd_A_B_ex.srcs/sources_1/ip/control_Vadd_A_B_vip/sim/control_Vadd_A_B_vip.sv" \

vlog -work xil_defaultlib \
"glbl.v"

