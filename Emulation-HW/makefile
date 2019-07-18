#
# this file was created by a computer. trust it.
#

# compiler tools
XILINX_SDX ?= /home/lzc/document/Xilinx/SDx/2019.1
XILINX_XRT ?= /opt/xilinx/xrt
XILINX_SDK ?= $(XILINX_SDX)/../../SDK/2019.1
XILINX_VIVADO ?= /home/lzc/document/Xilinx/Vivado/2019.1
XILINX_VIVADO_HLS ?= $(XILINX_SDX)/Vivado_HLS

HOST_CXX ?= ${XILINX_SDX}/bin/xcpp
XOCC ?= ${XILINX_SDX}/bin/xocc
EMCONFIGUTIL = ${XILINX_SDX}/bin/emconfigutil --od .
RM = rm -f
RMDIR = rm -rf

SDX_PLATFORM = xilinx_u200_xdma_201830_2
SDX_PLATFORM_PATH = $(SDX_PLATFORM)

# host compiler global settings
CXXFLAGS += -DSDX_PLATFORM=$(SDX_PLATFORM) -D__USE_XOPEN2K8 -I$(XILINX_XRT)/include/ -I$(XILINX_VIVADO)/include/ -O0 -g -Wall -c -fmessage-length=0 -std=c++14
LDFLAGS += -lxilinxopencl -lpthread -lrt -lstdc++ -lmpfr -lgmp -lhlsmc++-GCC46 -lIp_floating_point_v7_0_bitacc_cmodel -lIp_xfft_v9_1_bitacc_cmodel -lIp_fir_compiler_v7_2_bitacc_cmodel -lIp_dds_compiler_v6_0_bitacc_cmodel -L$(XILINX_XRT)/lib/ -L$(XILINX_VIVADO)/lnx64/tools/fpo_v7_0 -L$(XILINX_VIVADO)/lnx64/lib/csim -L$(XILINX_VIVADO)/lnx64/tools/dds_v6_0 -L$(XILINX_VIVADO)/lnx64/tools/fir_v7_0 -L$(XILINX_VIVADO)/lnx64/tools/fft_v9_1 -Wl,-rpath-link,$(XILINX_XRT)/lib -Wl,-rpath,$(XILINX_VIVADO)/lnx64/lib/csim -Wl,-rpath,$(XILINX_VIVADO)/lnx64/tools/fpo_v7_0 -Wl,-rpath,$(XILINX_VIVADO)/lnx64/tools/fft_v9_1 -Wl,-rpath,$(XILINX_VIVADO)/lnx64/tools/fir_v7_0 -Wl,-rpath,$(XILINX_VIVADO)/lnx64/tools/dds_v6_0

# hardware compiler global settings
XOCC_OPTS = -t hw_emu --platform $(SDX_PLATFORM_PATH) --save-temps  

#
# OpenCL kernel files
#

#
# host files
#

HOST_OBJECTS += src/host.o

HOST_EXE = decoder.exe

BUILD_SUBDIRS += src/

EMCONFIG_FILE = emconfig.json

#
# primary build targets
#

.PHONY: all clean
all: $(BINARY_CONTAINERS) $(HOST_EXE) $(EMCONFIG_FILE)

.NOTPARALLEL: clean

clean-host:
	-$(RM) $(HOST_EXE) $(HOST_OBJECTS)

clean-accelerators:
	-$(RM) $(BINARY_CONTAINERS) $(ALL_KERNEL_OBJS) $(ALL_MESSAGE_FILES)  $(EMCONFIG_FILE)
	-$(RM) *.xclbin.sh *.xclbin.info
	-$(RMDIR) $(BUILD_SUBDIRS)
	-$(RMDIR) .Xil

clean: clean-host clean-accelerators

.PHONY: incremental
incremental: all

include makeemconfig.mk

nothing:

#
# host rules
#

src/host.o: ../src/host.cpp ../../../../..$(XILINX_XRT)/include/xclhal2.h
	@mkdir -p $(@D)
	$(HOST_CXX) $(CXXFLAGS) -o "$@" "$<"

$(HOST_EXE): $(HOST_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)

#
# emulation configuration file
#

$(EMCONFIG_FILE): makeemconfig.mk
	$(EMCONFIGUTIL) --nd $(NUMBER_OF_DEVICES)  --platform $(SDX_PLATFORM_PATH)
	-@$(RMDIR) TempConfig .Xil/configutil*

