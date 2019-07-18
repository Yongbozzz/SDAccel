KERNEL_NAME:=Vadd_A_B
TARGET ?= $(KERNEL_NAME)_host_example.exe

SRC_DIRS ?= src

ifndef XILINX_XRT
$(error environment variable XILINX_XRT is not set. Please ensure the Xilinx runtime is installed and properly sourced)
endif

DEVICE ?= xilinx:u200:xdma:201830.2
PLATFORM_VLNV := $(DEVICE)

PLATFORM := $(subst :,_,$(PLATFORM_VLNV))
PLATFORM := $(subst .,_,$(PLATFORM))
SRCS := $(shell find $(SRC_DIRS) -name *.cpp -or -name *.c -or -name *.s)
OBJS := $(addsuffix .o,$(basename $(SRCS)))
DEPS := $(OBJS:.o=.d)
LDLIBS := -lxilinxopencl -lpthread -lrt -lstdc++
LOADLIBES := -L$(XILINX_XRT)/lib

INC_DIRS := $(shell find $(SRC_DIRS) -type d) $(XILINX_XRT)/include
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

CPPFLAGS ?= $(INC_FLAGS) -MMD -MP -std=gnu++11 -g -Wall -DSDX_PLATFORM=$(PLATFORM)

$(TARGET): $(OBJS)
	$(CXX) $(LDFLAGS) $(OBJS) -o $@ $(LOADLIBES) $(LDLIBS)

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJS) $(DEPS)

-include $(DEPS)

