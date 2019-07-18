set moduleName Vadd_A_B
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {Vadd_A_B}
set C_modelType { void 0 }
set C_modelArgList {
	{ m00_axi int 32 regular {axi_master 2}  }
	{ m01_axi int 32 regular {axi_master 2}  }
	{ scalar00 int 32 unused {axi_slave 0}  }
	{ A int 64 regular {axi_slave 0}  }
	{ B int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m00_axi", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "A","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "A","bundle": "control"},"direction": "READWRITE","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m01_axi", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "B","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "B","bundle": "control"},"direction": "READWRITE","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "scalar00", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "scalar00","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "A", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":35}} , 
 	{ "Name" : "B", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":36}, "offset_end" : {"in":47}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_m00_axi_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_m00_axi_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_m00_axi_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_m00_axi_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_m00_axi_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_m00_axi_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_m00_axi_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_m00_axi_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_m00_axi_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_m00_axi_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_m00_axi_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_m00_axi_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_m00_axi_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_m00_axi_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_m00_axi_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_m00_axi_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_m00_axi_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_m00_axi_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_m00_axi_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_m00_axi_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_m00_axi_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_m00_axi_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_m00_axi_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_m00_axi_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_m00_axi_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_m00_axi_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_m00_axi_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_m00_axi_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_m00_axi_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_m00_axi_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_m00_axi_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_m00_axi_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_m00_axi_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_m00_axi_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_m01_axi_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_m01_axi_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_m01_axi_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_m01_axi_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_m01_axi_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_m01_axi_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_m01_axi_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_m01_axi_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_m01_axi_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_m01_axi_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_m01_axi_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_m01_axi_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_m01_axi_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_m01_axi_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_m01_axi_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_m01_axi_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_m01_axi_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_m01_axi_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_m01_axi_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_m01_axi_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_m01_axi_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_m01_axi_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_m01_axi_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_m01_axi_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_m01_axi_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_m01_axi_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_m01_axi_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_m01_axi_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_m01_axi_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_m01_axi_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_m01_axi_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_m01_axi_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_m01_axi_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_m01_axi_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"Vadd_A_B","role":"start","value":"0","valid_bit":"0"},{"name":"Vadd_A_B","role":"continue","value":"0","valid_bit":"4"},{"name":"Vadd_A_B","role":"auto_start","value":"0","valid_bit":"7"},{"name":"scalar00","role":"data","value":"16"},{"name":"A","role":"data","value":"24"},{"name":"B","role":"data","value":"36"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"Vadd_A_B","role":"start","value":"0","valid_bit":"0"},{"name":"Vadd_A_B","role":"done","value":"0","valid_bit":"1"},{"name":"Vadd_A_B","role":"idle","value":"0","valid_bit":"2"},{"name":"Vadd_A_B","role":"ready","value":"0","valid_bit":"3"},{"name":"Vadd_A_B","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_m00_axi_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWVALID" }} , 
 	{ "name": "m_axi_m00_axi_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWREADY" }} , 
 	{ "name": "m_axi_m00_axi_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWADDR" }} , 
 	{ "name": "m_axi_m00_axi_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWID" }} , 
 	{ "name": "m_axi_m00_axi_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWLEN" }} , 
 	{ "name": "m_axi_m00_axi_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_m00_axi_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWBURST" }} , 
 	{ "name": "m_axi_m00_axi_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_m00_axi_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_m00_axi_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWPROT" }} , 
 	{ "name": "m_axi_m00_axi_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWQOS" }} , 
 	{ "name": "m_axi_m00_axi_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWREGION" }} , 
 	{ "name": "m_axi_m00_axi_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "AWUSER" }} , 
 	{ "name": "m_axi_m00_axi_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "WVALID" }} , 
 	{ "name": "m_axi_m00_axi_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "WREADY" }} , 
 	{ "name": "m_axi_m00_axi_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m00_axi", "role": "WDATA" }} , 
 	{ "name": "m_axi_m00_axi_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m00_axi", "role": "WSTRB" }} , 
 	{ "name": "m_axi_m00_axi_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "WLAST" }} , 
 	{ "name": "m_axi_m00_axi_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "WID" }} , 
 	{ "name": "m_axi_m00_axi_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "WUSER" }} , 
 	{ "name": "m_axi_m00_axi_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARVALID" }} , 
 	{ "name": "m_axi_m00_axi_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARREADY" }} , 
 	{ "name": "m_axi_m00_axi_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARADDR" }} , 
 	{ "name": "m_axi_m00_axi_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARID" }} , 
 	{ "name": "m_axi_m00_axi_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARLEN" }} , 
 	{ "name": "m_axi_m00_axi_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_m00_axi_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARBURST" }} , 
 	{ "name": "m_axi_m00_axi_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_m00_axi_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_m00_axi_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARPROT" }} , 
 	{ "name": "m_axi_m00_axi_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARQOS" }} , 
 	{ "name": "m_axi_m00_axi_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARREGION" }} , 
 	{ "name": "m_axi_m00_axi_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "ARUSER" }} , 
 	{ "name": "m_axi_m00_axi_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "RVALID" }} , 
 	{ "name": "m_axi_m00_axi_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "RREADY" }} , 
 	{ "name": "m_axi_m00_axi_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m00_axi", "role": "RDATA" }} , 
 	{ "name": "m_axi_m00_axi_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "RLAST" }} , 
 	{ "name": "m_axi_m00_axi_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "RID" }} , 
 	{ "name": "m_axi_m00_axi_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "RUSER" }} , 
 	{ "name": "m_axi_m00_axi_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m00_axi", "role": "RRESP" }} , 
 	{ "name": "m_axi_m00_axi_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "BVALID" }} , 
 	{ "name": "m_axi_m00_axi_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "BREADY" }} , 
 	{ "name": "m_axi_m00_axi_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m00_axi", "role": "BRESP" }} , 
 	{ "name": "m_axi_m00_axi_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "BID" }} , 
 	{ "name": "m_axi_m00_axi_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m00_axi", "role": "BUSER" }} , 
 	{ "name": "m_axi_m01_axi_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWVALID" }} , 
 	{ "name": "m_axi_m01_axi_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWREADY" }} , 
 	{ "name": "m_axi_m01_axi_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWADDR" }} , 
 	{ "name": "m_axi_m01_axi_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWID" }} , 
 	{ "name": "m_axi_m01_axi_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWLEN" }} , 
 	{ "name": "m_axi_m01_axi_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_m01_axi_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWBURST" }} , 
 	{ "name": "m_axi_m01_axi_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_m01_axi_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_m01_axi_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWPROT" }} , 
 	{ "name": "m_axi_m01_axi_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWQOS" }} , 
 	{ "name": "m_axi_m01_axi_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWREGION" }} , 
 	{ "name": "m_axi_m01_axi_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "AWUSER" }} , 
 	{ "name": "m_axi_m01_axi_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "WVALID" }} , 
 	{ "name": "m_axi_m01_axi_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "WREADY" }} , 
 	{ "name": "m_axi_m01_axi_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m01_axi", "role": "WDATA" }} , 
 	{ "name": "m_axi_m01_axi_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m01_axi", "role": "WSTRB" }} , 
 	{ "name": "m_axi_m01_axi_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "WLAST" }} , 
 	{ "name": "m_axi_m01_axi_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "WID" }} , 
 	{ "name": "m_axi_m01_axi_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "WUSER" }} , 
 	{ "name": "m_axi_m01_axi_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARVALID" }} , 
 	{ "name": "m_axi_m01_axi_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARREADY" }} , 
 	{ "name": "m_axi_m01_axi_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARADDR" }} , 
 	{ "name": "m_axi_m01_axi_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARID" }} , 
 	{ "name": "m_axi_m01_axi_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARLEN" }} , 
 	{ "name": "m_axi_m01_axi_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_m01_axi_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARBURST" }} , 
 	{ "name": "m_axi_m01_axi_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_m01_axi_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_m01_axi_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARPROT" }} , 
 	{ "name": "m_axi_m01_axi_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARQOS" }} , 
 	{ "name": "m_axi_m01_axi_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARREGION" }} , 
 	{ "name": "m_axi_m01_axi_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "ARUSER" }} , 
 	{ "name": "m_axi_m01_axi_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "RVALID" }} , 
 	{ "name": "m_axi_m01_axi_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "RREADY" }} , 
 	{ "name": "m_axi_m01_axi_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m01_axi", "role": "RDATA" }} , 
 	{ "name": "m_axi_m01_axi_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "RLAST" }} , 
 	{ "name": "m_axi_m01_axi_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "RID" }} , 
 	{ "name": "m_axi_m01_axi_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "RUSER" }} , 
 	{ "name": "m_axi_m01_axi_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m01_axi", "role": "RRESP" }} , 
 	{ "name": "m_axi_m01_axi_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "BVALID" }} , 
 	{ "name": "m_axi_m01_axi_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "BREADY" }} , 
 	{ "name": "m_axi_m01_axi_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m01_axi", "role": "BRESP" }} , 
 	{ "name": "m_axi_m01_axi_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "BID" }} , 
 	{ "name": "m_axi_m01_axi_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m01_axi", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7"],
		"CDFG" : "Vadd_A_B",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24609", "EstimateLatencyMax" : "24609",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "m00_axi", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "m00_axi_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "m00_axi_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "m00_axi_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "m00_axi_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "m00_axi_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "m01_axi", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "m01_axi_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "m01_axi_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "m01_axi_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "m01_axi_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "m01_axi_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "scalar00", "Type" : "None", "Direction" : "I"},
			{"Name" : "A", "Type" : "None", "Direction" : "I"},
			{"Name" : "B", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vadd_A_B_control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vadd_A_B_m00_axi_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vadd_A_B_m01_axi_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m00_axi_input_buffer_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m00_axi_output_buffer_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m01_axi_input_buffer_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m01_axi_output_buffer_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Vadd_A_B {
		m00_axi {Type IO LastRead 14 FirstWrite 14}
		m01_axi {Type IO LastRead 25 FirstWrite 26}
		scalar00 {Type I LastRead -1 FirstWrite -1}
		A {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "24609", "Max" : "24609"}
	, {"Name" : "Interval", "Min" : "24610", "Max" : "24610"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
	{"Pipeline" : "3", "EnableSignal" : "ap_enable_pp3"}
	{"Pipeline" : "4", "EnableSignal" : "ap_enable_pp4"}
	{"Pipeline" : "5", "EnableSignal" : "ap_enable_pp5"}
]}

set Spec2ImplPortList { 
	m00_axi { m_axi {  { m_axi_m00_axi_AWVALID VALID 1 1 }  { m_axi_m00_axi_AWREADY READY 0 1 }  { m_axi_m00_axi_AWADDR ADDR 1 64 }  { m_axi_m00_axi_AWID ID 1 1 }  { m_axi_m00_axi_AWLEN LEN 1 8 }  { m_axi_m00_axi_AWSIZE SIZE 1 3 }  { m_axi_m00_axi_AWBURST BURST 1 2 }  { m_axi_m00_axi_AWLOCK LOCK 1 2 }  { m_axi_m00_axi_AWCACHE CACHE 1 4 }  { m_axi_m00_axi_AWPROT PROT 1 3 }  { m_axi_m00_axi_AWQOS QOS 1 4 }  { m_axi_m00_axi_AWREGION REGION 1 4 }  { m_axi_m00_axi_AWUSER USER 1 1 }  { m_axi_m00_axi_WVALID VALID 1 1 }  { m_axi_m00_axi_WREADY READY 0 1 }  { m_axi_m00_axi_WDATA DATA 1 32 }  { m_axi_m00_axi_WSTRB STRB 1 4 }  { m_axi_m00_axi_WLAST LAST 1 1 }  { m_axi_m00_axi_WID ID 1 1 }  { m_axi_m00_axi_WUSER USER 1 1 }  { m_axi_m00_axi_ARVALID VALID 1 1 }  { m_axi_m00_axi_ARREADY READY 0 1 }  { m_axi_m00_axi_ARADDR ADDR 1 64 }  { m_axi_m00_axi_ARID ID 1 1 }  { m_axi_m00_axi_ARLEN LEN 1 8 }  { m_axi_m00_axi_ARSIZE SIZE 1 3 }  { m_axi_m00_axi_ARBURST BURST 1 2 }  { m_axi_m00_axi_ARLOCK LOCK 1 2 }  { m_axi_m00_axi_ARCACHE CACHE 1 4 }  { m_axi_m00_axi_ARPROT PROT 1 3 }  { m_axi_m00_axi_ARQOS QOS 1 4 }  { m_axi_m00_axi_ARREGION REGION 1 4 }  { m_axi_m00_axi_ARUSER USER 1 1 }  { m_axi_m00_axi_RVALID VALID 0 1 }  { m_axi_m00_axi_RREADY READY 1 1 }  { m_axi_m00_axi_RDATA DATA 0 32 }  { m_axi_m00_axi_RLAST LAST 0 1 }  { m_axi_m00_axi_RID ID 0 1 }  { m_axi_m00_axi_RUSER USER 0 1 }  { m_axi_m00_axi_RRESP RESP 0 2 }  { m_axi_m00_axi_BVALID VALID 0 1 }  { m_axi_m00_axi_BREADY READY 1 1 }  { m_axi_m00_axi_BRESP RESP 0 2 }  { m_axi_m00_axi_BID ID 0 1 }  { m_axi_m00_axi_BUSER USER 0 1 } } }
	m01_axi { m_axi {  { m_axi_m01_axi_AWVALID VALID 1 1 }  { m_axi_m01_axi_AWREADY READY 0 1 }  { m_axi_m01_axi_AWADDR ADDR 1 64 }  { m_axi_m01_axi_AWID ID 1 1 }  { m_axi_m01_axi_AWLEN LEN 1 8 }  { m_axi_m01_axi_AWSIZE SIZE 1 3 }  { m_axi_m01_axi_AWBURST BURST 1 2 }  { m_axi_m01_axi_AWLOCK LOCK 1 2 }  { m_axi_m01_axi_AWCACHE CACHE 1 4 }  { m_axi_m01_axi_AWPROT PROT 1 3 }  { m_axi_m01_axi_AWQOS QOS 1 4 }  { m_axi_m01_axi_AWREGION REGION 1 4 }  { m_axi_m01_axi_AWUSER USER 1 1 }  { m_axi_m01_axi_WVALID VALID 1 1 }  { m_axi_m01_axi_WREADY READY 0 1 }  { m_axi_m01_axi_WDATA DATA 1 32 }  { m_axi_m01_axi_WSTRB STRB 1 4 }  { m_axi_m01_axi_WLAST LAST 1 1 }  { m_axi_m01_axi_WID ID 1 1 }  { m_axi_m01_axi_WUSER USER 1 1 }  { m_axi_m01_axi_ARVALID VALID 1 1 }  { m_axi_m01_axi_ARREADY READY 0 1 }  { m_axi_m01_axi_ARADDR ADDR 1 64 }  { m_axi_m01_axi_ARID ID 1 1 }  { m_axi_m01_axi_ARLEN LEN 1 8 }  { m_axi_m01_axi_ARSIZE SIZE 1 3 }  { m_axi_m01_axi_ARBURST BURST 1 2 }  { m_axi_m01_axi_ARLOCK LOCK 1 2 }  { m_axi_m01_axi_ARCACHE CACHE 1 4 }  { m_axi_m01_axi_ARPROT PROT 1 3 }  { m_axi_m01_axi_ARQOS QOS 1 4 }  { m_axi_m01_axi_ARREGION REGION 1 4 }  { m_axi_m01_axi_ARUSER USER 1 1 }  { m_axi_m01_axi_RVALID VALID 0 1 }  { m_axi_m01_axi_RREADY READY 1 1 }  { m_axi_m01_axi_RDATA DATA 0 32 }  { m_axi_m01_axi_RLAST LAST 0 1 }  { m_axi_m01_axi_RID ID 0 1 }  { m_axi_m01_axi_RUSER USER 0 1 }  { m_axi_m01_axi_RRESP RESP 0 2 }  { m_axi_m01_axi_BVALID VALID 0 1 }  { m_axi_m01_axi_BREADY READY 1 1 }  { m_axi_m01_axi_BRESP RESP 0 2 }  { m_axi_m01_axi_BID ID 0 1 }  { m_axi_m01_axi_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ m00_axi { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ m01_axi { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ m00_axi 1 }
	{ m01_axi 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ m00_axi 1 }
	{ m01_axi 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
