// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xvadd_a_b.h"

extern XVadd_a_b_Config XVadd_a_b_ConfigTable[];

XVadd_a_b_Config *XVadd_a_b_LookupConfig(u16 DeviceId) {
	XVadd_a_b_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XVADD_A_B_NUM_INSTANCES; Index++) {
		if (XVadd_a_b_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XVadd_a_b_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XVadd_a_b_Initialize(XVadd_a_b *InstancePtr, u16 DeviceId) {
	XVadd_a_b_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XVadd_a_b_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XVadd_a_b_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

