// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : Data signal of scalar00
//        bit 31~0 - scalar00[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of A
//        bit 31~0 - A[31:0] (Read/Write)
// 0x1c : Data signal of A
//        bit 31~0 - A[63:32] (Read/Write)
// 0x20 : reserved
// 0x24 : Data signal of B
//        bit 31~0 - B[31:0] (Read/Write)
// 0x28 : Data signal of B
//        bit 31~0 - B[63:32] (Read/Write)
// 0x2c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XVADD_A_B_CONTROL_ADDR_AP_CTRL       0x00
#define XVADD_A_B_CONTROL_ADDR_GIE           0x04
#define XVADD_A_B_CONTROL_ADDR_IER           0x08
#define XVADD_A_B_CONTROL_ADDR_ISR           0x0c
#define XVADD_A_B_CONTROL_ADDR_SCALAR00_DATA 0x10
#define XVADD_A_B_CONTROL_BITS_SCALAR00_DATA 32
#define XVADD_A_B_CONTROL_ADDR_A_DATA        0x18
#define XVADD_A_B_CONTROL_BITS_A_DATA        64
#define XVADD_A_B_CONTROL_ADDR_B_DATA        0x24
#define XVADD_A_B_CONTROL_BITS_B_DATA        64

