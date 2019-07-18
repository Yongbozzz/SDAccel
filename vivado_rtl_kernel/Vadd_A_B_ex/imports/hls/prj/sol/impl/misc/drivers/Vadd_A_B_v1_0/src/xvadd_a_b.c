// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xvadd_a_b.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XVadd_a_b_CfgInitialize(XVadd_a_b *InstancePtr, XVadd_a_b_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XVadd_a_b_Start(XVadd_a_b *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_AP_CTRL) & 0x80;
    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XVadd_a_b_IsDone(XVadd_a_b *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XVadd_a_b_IsIdle(XVadd_a_b *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XVadd_a_b_IsReady(XVadd_a_b *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XVadd_a_b_EnableAutoRestart(XVadd_a_b *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XVadd_a_b_DisableAutoRestart(XVadd_a_b *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_AP_CTRL, 0);
}

void XVadd_a_b_Set_scalar00(XVadd_a_b *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_SCALAR00_DATA, Data);
}

u32 XVadd_a_b_Get_scalar00(XVadd_a_b *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_SCALAR00_DATA);
    return Data;
}

void XVadd_a_b_Set_A(XVadd_a_b *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_A_DATA, (u32)(Data));
    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XVadd_a_b_Get_A(XVadd_a_b *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_A_DATA);
    Data += (u64)XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XVadd_a_b_Set_B(XVadd_a_b *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_B_DATA, (u32)(Data));
    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XVadd_a_b_Get_B(XVadd_a_b *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_B_DATA);
    Data += (u64)XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XVadd_a_b_InterruptGlobalEnable(XVadd_a_b *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_GIE, 1);
}

void XVadd_a_b_InterruptGlobalDisable(XVadd_a_b *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_GIE, 0);
}

void XVadd_a_b_InterruptEnable(XVadd_a_b *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_IER);
    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_IER, Register | Mask);
}

void XVadd_a_b_InterruptDisable(XVadd_a_b *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_IER);
    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_IER, Register & (~Mask));
}

void XVadd_a_b_InterruptClear(XVadd_a_b *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XVadd_a_b_WriteReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_ISR, Mask);
}

u32 XVadd_a_b_InterruptGetEnabled(XVadd_a_b *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_IER);
}

u32 XVadd_a_b_InterruptGetStatus(XVadd_a_b *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XVadd_a_b_ReadReg(InstancePtr->Control_BaseAddress, XVADD_A_B_CONTROL_ADDR_ISR);
}

