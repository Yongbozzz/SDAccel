// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XVADD_A_B_H
#define XVADD_A_B_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xvadd_a_b_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XVadd_a_b_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XVadd_a_b;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XVadd_a_b_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XVadd_a_b_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XVadd_a_b_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XVadd_a_b_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XVadd_a_b_Initialize(XVadd_a_b *InstancePtr, u16 DeviceId);
XVadd_a_b_Config* XVadd_a_b_LookupConfig(u16 DeviceId);
int XVadd_a_b_CfgInitialize(XVadd_a_b *InstancePtr, XVadd_a_b_Config *ConfigPtr);
#else
int XVadd_a_b_Initialize(XVadd_a_b *InstancePtr, const char* InstanceName);
int XVadd_a_b_Release(XVadd_a_b *InstancePtr);
#endif

void XVadd_a_b_Start(XVadd_a_b *InstancePtr);
u32 XVadd_a_b_IsDone(XVadd_a_b *InstancePtr);
u32 XVadd_a_b_IsIdle(XVadd_a_b *InstancePtr);
u32 XVadd_a_b_IsReady(XVadd_a_b *InstancePtr);
void XVadd_a_b_EnableAutoRestart(XVadd_a_b *InstancePtr);
void XVadd_a_b_DisableAutoRestart(XVadd_a_b *InstancePtr);

void XVadd_a_b_Set_scalar00(XVadd_a_b *InstancePtr, u32 Data);
u32 XVadd_a_b_Get_scalar00(XVadd_a_b *InstancePtr);
void XVadd_a_b_Set_A(XVadd_a_b *InstancePtr, u64 Data);
u64 XVadd_a_b_Get_A(XVadd_a_b *InstancePtr);
void XVadd_a_b_Set_B(XVadd_a_b *InstancePtr, u64 Data);
u64 XVadd_a_b_Get_B(XVadd_a_b *InstancePtr);

void XVadd_a_b_InterruptGlobalEnable(XVadd_a_b *InstancePtr);
void XVadd_a_b_InterruptGlobalDisable(XVadd_a_b *InstancePtr);
void XVadd_a_b_InterruptEnable(XVadd_a_b *InstancePtr, u32 Mask);
void XVadd_a_b_InterruptDisable(XVadd_a_b *InstancePtr, u32 Mask);
void XVadd_a_b_InterruptClear(XVadd_a_b *InstancePtr, u32 Mask);
u32 XVadd_a_b_InterruptGetEnabled(XVadd_a_b *InstancePtr);
u32 XVadd_a_b_InterruptGetStatus(XVadd_a_b *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
