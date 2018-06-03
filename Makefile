PROJECT_NAME := BNRaggingRights-Firmware

export OUTPUT_FILENAME
#MAKEFILE_NAME := $(CURDIR)/$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
MAKEFILE_NAME := $(MAKEFILE_LIST)
MAKEFILE_DIR := $(dir $(MAKEFILE_NAME) ) 

TEMPLATE_PATH = /Users/814k31/Develop/nRF5_SDK_11.0.0_89a8197/components/toolchain/gcc
SDK_PATH = /Users/814k31/Develop/nRF5_SDK_11.0.0_89a8197

include ./Makefile.posix

RTT_DIR := /Users/814k31/Develop/RTT_Implementation_141217
# RTT build config
RTT_SRCS = $(RTT_DIR)/RTT/SEGGER_RTT.c \
	   $(RTT_DIR)/RTT/SEGGER_RTT_printf.c

RTT_INC = -I $(RTT_DIR)/RTT

MK := mkdir
RM := rm -rf

#echo suspend
ifeq ("$(VERBOSE)","1")
NO_ECHO := 
else
NO_ECHO := @
endif

# Toolchain commands
CC              := '$(GNU_INSTALL_ROOT)/bin/$(GNU_PREFIX)-gcc'
AS              := '$(GNU_INSTALL_ROOT)/bin/$(GNU_PREFIX)-as'
AR              := '$(GNU_INSTALL_ROOT)/bin/$(GNU_PREFIX)-ar' -r
LD              := '$(GNU_INSTALL_ROOT)/bin/$(GNU_PREFIX)-ld'
NM              := '$(GNU_INSTALL_ROOT)/bin/$(GNU_PREFIX)-nm'
OBJDUMP         := '$(GNU_INSTALL_ROOT)/bin/$(GNU_PREFIX)-objdump'
OBJCOPY         := '$(GNU_INSTALL_ROOT)/bin/$(GNU_PREFIX)-objcopy'
SIZE            := '$(GNU_INSTALL_ROOT)/bin/$(GNU_PREFIX)-size'

#function for removing duplicates in a list
remduplicates = $(strip $(if $1,$(firstword $1) $(call remduplicates,$(filter-out $(firstword $1),$1))))

#source common to all targets
C_SOURCE_FILES += \
$(abspath $(SDK_PATH)/components/libraries/button/app_button.c) \
$(abspath $(SDK_PATH)/components/libraries/util/app_error.c) \
$(abspath $(SDK_PATH)/components/libraries/util/app_error_weak.c) \
$(abspath $(SDK_PATH)/components/libraries/timer/app_timer.c) \
$(abspath $(SDK_PATH)/components/libraries/trace/app_trace.c) \
$(abspath $(SDK_PATH)/components/libraries/util/app_util_platform.c) \
$(abspath $(SDK_PATH)/components/libraries/fstorage/fstorage.c) \
$(abspath $(SDK_PATH)/components/libraries/util/nrf_assert.c) \
$(abspath $(SDK_PATH)/components/libraries/util/nrf_log.c) \
$(abspath $(SDK_PATH)/components/libraries/uart/retarget.c) \
$(abspath $(SDK_PATH)/components/libraries/sensorsim/sensorsim.c) \
$(abspath $(SDK_PATH)/components/libraries/uart/app_uart.c) \
$(abspath $(SDK_PATH)/components/drivers_nrf/delay/nrf_delay.c) \
$(abspath $(SDK_PATH)/components/drivers_nrf/common/nrf_drv_common.c) \
$(abspath $(SDK_PATH)/components/drivers_nrf/gpiote/nrf_drv_gpiote.c) \
$(abspath $(SDK_PATH)/components/drivers_nrf/uart/nrf_drv_uart.c) \
$(abspath $(SDK_PATH)/components/drivers_nrf/pstorage/pstorage.c) \
$(abspath $(SDK_PATH)/examples/bsp/bsp.c) \
$(abspath $(SDK_PATH)/examples/bsp/bsp_btn_ble.c) \
$(abspath ./our_service.c) \
$(abspath ./main.c) \
$(abspath $(SDK_PATH)/components/ble/common/ble_advdata.c) \
$(abspath $(SDK_PATH)/components/ble/ble_advertising/ble_advertising.c) \
$(abspath $(SDK_PATH)/components/ble/common/ble_conn_params.c) \
$(abspath $(SDK_PATH)/components/ble/common/ble_srv_common.c) \
$(abspath $(SDK_PATH)/components/ble/device_manager/device_manager_peripheral.c) \
$(abspath $(SDK_PATH)/components/toolchain/system_nrf52.c) \
$(abspath $(SDK_PATH)/components/softdevice/common/softdevice_handler/softdevice_handler.c) \
$(RTT_SRCS) \

#assembly files common to all targets
ASM_SOURCE_FILES  = $(abspath $(SDK_PATH)/components/toolchain/gcc/gcc_startup_nrf52.s)

#includes common to all targets
INC_PATHS  = -I$(abspath ./config/ble_app_template_s132_pca10040)
INC_PATHS += -I$(abspath ./config)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/drivers_nrf/config)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/libraries/timer)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/libraries/fstorage/config)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/drivers_nrf/delay)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/softdevice/s132/headers/nrf52)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/libraries/util)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/ble/device_manager)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/drivers_nrf/uart)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/ble/common)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/libraries/sensorsim)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/drivers_nrf/pstorage)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/libraries/uart)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/device)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/libraries/button)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/libraries/fstorage)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/libraries/experimental_section_vars)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/softdevice/s132/headers)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/drivers_nrf/gpiote)
INC_PATHS += -I$(abspath $(SDK_PATH)/examples/bsp)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/toolchain/CMSIS/Include)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/drivers_nrf/hal)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/toolchain/gcc)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/toolchain)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/drivers_nrf/common)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/ble/ble_advertising)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/libraries/trace)
INC_PATHS += -I$(abspath $(SDK_PATH)/components/softdevice/common/softdevice_handler)
INC_PATHS += $(RTT_INC)

OBJECT_DIRECTORY = _build
LISTING_DIRECTORY = $(OBJECT_DIRECTORY)
OUTPUT_BINARY_DIRECTORY = $(OBJECT_DIRECTORY)

# Sorting removes duplicates
BUILD_DIRECTORIES := $(sort $(OBJECT_DIRECTORY) $(OUTPUT_BINARY_DIRECTORY) $(LISTING_DIRECTORY) )

#flags common to all targets
CFLAGS  = -DNRF52
CFLAGS += -DSOFTDEVICE_PRESENT
CFLAGS += -DBOARD_PCA10040
CFLAGS += -DNRF52_PAN_12
CFLAGS += -DNRF52_PAN_15
CFLAGS += -DNRF52_PAN_58
CFLAGS += -DNRF52_PAN_55
CFLAGS += -DNRF52_PAN_54
CFLAGS += -DNRF52_PAN_31
CFLAGS += -DNRF52_PAN_30
CFLAGS += -DNRF52_PAN_51
CFLAGS += -DNRF52_PAN_36
CFLAGS += -DNRF52_PAN_53
CFLAGS += -DNRF_LOG_USES_UART=1
CFLAGS += -DS132
CFLAGS += -DCONFIG_GPIO_AS_PINRESET
CFLAGS += -DBLE_STACK_SUPPORT_REQD
CFLAGS += -DSWI_DISABLE0
CFLAGS += -DNRF52_PAN_20
CFLAGS += -DNRF52_PAN_64
CFLAGS += -DNRF52_PAN_62
CFLAGS += -DNRF52_PAN_63
CFLAGS += -mcpu=cortex-m4
CFLAGS += -mthumb -mabi=aapcs --std=gnu99
# CFLAGS += -Wall -Werror -O3 -g3
CFLAGS += -Wall -O3 -g3
CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
# keep every function in separate section. This will allow linker to dump unused functions
CFLAGS += -ffunction-sections -fdata-sections -fno-strict-aliasing
CFLAGS += -fno-builtin --short-enums 
# keep every function in separate section. This will allow linker to dump unused functions
LDFLAGS += -Xlinker -Map=$(LISTING_DIRECTORY)/$(OUTPUT_FILENAME).map
LDFLAGS += -mthumb -mabi=aapcs -L $(TEMPLATE_PATH) -T$(LINKER_SCRIPT)
LDFLAGS += -mcpu=cortex-m4
LDFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
# let linker to dump unused sections
LDFLAGS += -Wl,--gc-sections
# use newlib in nano version
LDFLAGS += --specs=nano.specs -lc -lnosys

# Assembler flags
ASMFLAGS += -x assembler-with-cpp
ASMFLAGS += -DNRF52
ASMFLAGS += -DSOFTDEVICE_PRESENT
ASMFLAGS += -DBOARD_PCA10040
ASMFLAGS += -DNRF52_PAN_12
ASMFLAGS += -DNRF52_PAN_15
ASMFLAGS += -DNRF52_PAN_58
ASMFLAGS += -DNRF52_PAN_55
ASMFLAGS += -DNRF52_PAN_54
ASMFLAGS += -DNRF52_PAN_31
ASMFLAGS += -DNRF52_PAN_30
ASMFLAGS += -DNRF52_PAN_51
ASMFLAGS += -DNRF52_PAN_36
ASMFLAGS += -DNRF52_PAN_53
ASMFLAGS += -DNRF_LOG_USES_UART=1
ASMFLAGS += -DS132
ASMFLAGS += -DCONFIG_GPIO_AS_PINRESET
ASMFLAGS += -DBLE_STACK_SUPPORT_REQD
ASMFLAGS += -DSWI_DISABLE0
ASMFLAGS += -DNRF52_PAN_20
ASMFLAGS += -DNRF52_PAN_64
ASMFLAGS += -DNRF52_PAN_62
ASMFLAGS += -DNRF52_PAN_63

#default target - first one defined
default: clean nrf52832_xxaa

#building all targets
all: clean
	$(NO_ECHO)$(MAKE) -f $(MAKEFILE_NAME) -C $(MAKEFILE_DIR) -e cleanobj
	$(NO_ECHO)$(MAKE) -f $(MAKEFILE_NAME) -C $(MAKEFILE_DIR) -e nrf52832_xxaa

#target for printing all targets
help:
	@echo following targets are available:
	@echo 	nrf52832_xxaa
	@echo 	flash_softdevice

C_SOURCE_FILE_NAMES = $(notdir $(C_SOURCE_FILES))
C_PATHS = $(call remduplicates, $(dir $(C_SOURCE_FILES) ) )
C_OBJECTS = $(addprefix $(OBJECT_DIRECTORY)/, $(C_SOURCE_FILE_NAMES:.c=.o) )

ASM_SOURCE_FILE_NAMES = $(notdir $(ASM_SOURCE_FILES))
ASM_PATHS = $(call remduplicates, $(dir $(ASM_SOURCE_FILES) ))
ASM_OBJECTS = $(addprefix $(OBJECT_DIRECTORY)/, $(ASM_SOURCE_FILE_NAMES:.s=.o) )

vpath %.c $(C_PATHS)
vpath %.s $(ASM_PATHS)

OBJECTS = $(C_OBJECTS) $(ASM_OBJECTS)

nrf52832_xxaa: OUTPUT_FILENAME := nrf52832_xxaa
nrf52832_xxaa: LINKER_SCRIPT=adafruit-nrf52.ld

nrf52832_xxaa: $(BUILD_DIRECTORIES) $(OBJECTS)
	@echo Linking target: $(OUTPUT_FILENAME).out
	$(NO_ECHO)$(CC) $(LDFLAGS) $(OBJECTS) $(LIBS) -lm -o $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).out
	$(NO_ECHO)$(MAKE) -f $(MAKEFILE_NAME) -C $(MAKEFILE_DIR) -e finalize

## Create build directories
$(BUILD_DIRECTORIES):
	echo $(MAKEFILE_NAME)
	$(MK) $@

# Create objects from C SRC files
$(OBJECT_DIRECTORY)/%.o: %.c
	@echo Compiling file: $(notdir $<)
	$(NO_ECHO)$(CC) $(CFLAGS) $(INC_PATHS) -c -o $@ $<

# Assemble files
$(OBJECT_DIRECTORY)/%.o: %.s
	@echo Assembly file: $(notdir $<)
	$(NO_ECHO)$(CC) $(ASMFLAGS) $(INC_PATHS) -c -o $@ $<
# Link
$(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).out: $(BUILD_DIRECTORIES) $(OBJECTS)
	@echo Linking target: $(OUTPUT_FILENAME).out
	$(NO_ECHO)$(CC) $(LDFLAGS) $(OBJECTS) $(LIBS) -lm -o $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).out
## Create binary .bin file from the .out file
$(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).bin: $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).out
	@echo Preparing: $(OUTPUT_FILENAME).bin
	$(NO_ECHO)$(OBJCOPY) -O binary $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).out $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).bin

## Create binary .hex file from the .out file
$(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).hex: $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).out
	@echo Preparing: $(OUTPUT_FILENAME).hex
	$(NO_ECHO)$(OBJCOPY) -O ihex $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).out $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).hex

finalize: genbin genhex echosize

genbin:
	@echo Preparing: $(OUTPUT_FILENAME).bin
	$(NO_ECHO)$(OBJCOPY) -O binary $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).out $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).bin

## Create binary .hex file from the .out file
genhex: 
	@echo Preparing: $(OUTPUT_FILENAME).hex
	@echo cpaths $(C_PATHS)
	@echo asmpaths $(ASM_PATHS)
	$(NO_ECHO)$(OBJCOPY) -O ihex $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).out $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).hex
echosize:
	-@echo ''
	$(NO_ECHO)$(SIZE) $(OUTPUT_BINARY_DIRECTORY)/$(OUTPUT_FILENAME).out
	-@echo ''

clean:
	$(RM) $(BUILD_DIRECTORIES)

cleanobj:
	$(RM) $(BUILD_DIRECTORIES)/*.o
# flash: nrf52832_xxaa
# 	@echo Flashing: $(OUTPUT_BINARY_DIRECTORY)/$<.hex
# 	nrfjprog --program $(OUTPUT_BINARY_DIRECTORY)/$<.hex -f nrf52  --sectorerase
# 	nrfjprog --reset -f nrf52

dfu: nrf52832_xxaa
	@echo Serial DFU Adafruit: $(OUTPUT_BINARY_DIRECTORY)/$<.zip
	nrfutil dfu genpkg --dev-type 0x0052 --application _build/nrf52832_xxaa.hex _build/dfu-package.zip
	nrfutil dfu serial --package _build/dfu-package.zip -p /dev/tty.SLAB_USBtoUART -b 115200

flash: nrf52832_xxaa
	@echo Flashing: $(OUTPUT_BINARY_DIRECTORY)/$<.hex
	nrfjprog --program $(OUTPUT_BINARY_DIRECTORY)/$<.hex -f nrf52  --sectorerase
	nrfjprog --reset -f nrf52

debug:
	@echo "JLinkExe -device NRF52 -if SWD -speed 4000 -autoconnect 1"
	@echo "JLinkRTTClient"

## Flash softdevice
flash_softdevice:
	@echo Flashing: s132_nrf52_2.0.0_softdevice.hex
	nrfjprog --program ../../../../../../components/softdevice/s132/hex/s132_nrf52_2.0.0_softdevice.hex -f nrf52 --chiperase
	nrfjprog --reset -f nrf52