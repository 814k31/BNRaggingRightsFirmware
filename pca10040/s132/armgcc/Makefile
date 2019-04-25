PROJECT_NAME     := BNRaggingRights-Firmware
TARGETS          := nrf52832_xxaa
OUTPUT_DIRECTORY := _build

GNU_INSTALL_ROOT = /Users/814k31/Downloads/gcc-arm-none-eabi-8-2018-q4-major/bin/
GNU_VERSION = 8.2.1
GNU_PREFIX = arm-none-eabi

SDK_ROOT := /Users/814k31/Develop/nRF5_SDK_15.3.0_59ac345
PROJ_DIR := ../../..

$(OUTPUT_DIRECTORY)/nrf52832_xxaa.out: \
  LINKER_SCRIPT  := ble_app_blinky_c_gcc_nrf52.ld

# Source files common to all targets
SRC_FILES += \
  $(abspath $(SDK_ROOT)/modules/nrfx/mdk/gcc_startup_nrf52.S) \
  $(abspath $(SDK_ROOT)/components/libraries/log/src/nrf_log_backend_rtt.c) \
  $(abspath $(SDK_ROOT)/components/libraries/log/src/nrf_log_backend_serial.c) \
  $(abspath $(SDK_ROOT)/components/libraries/log/src/nrf_log_backend_uart.c) \
  $(abspath $(SDK_ROOT)/components/libraries/log/src/nrf_log_default_backends.c) \
  $(abspath $(SDK_ROOT)/components/libraries/log/src/nrf_log_frontend.c) \
  $(abspath $(SDK_ROOT)/components/libraries/log/src/nrf_log_str_formatter.c) \
  $(abspath $(SDK_ROOT)/components/libraries/button/app_button.c) \
  $(abspath $(SDK_ROOT)/components/libraries/util/app_error.c) \
  $(abspath $(SDK_ROOT)/components/libraries/util/app_error_handler_gcc.c) \
  $(abspath $(SDK_ROOT)/components/libraries/util/app_error_weak.c) \
  $(abspath $(SDK_ROOT)/components/libraries/scheduler/app_scheduler.c) \
  $(abspath $(SDK_ROOT)/components/libraries/timer/app_timer.c) \
  $(abspath $(SDK_ROOT)/components/libraries/util/app_util_platform.c) \
  $(abspath $(SDK_ROOT)/components/libraries/hardfault/hardfault_implementation.c) \
  $(abspath $(SDK_ROOT)/components/libraries/util/nrf_assert.c) \
  $(abspath $(SDK_ROOT)/components/libraries/atomic_fifo/nrf_atfifo.c) \
  $(abspath $(SDK_ROOT)/components/libraries/atomic_flags/nrf_atflags.c) \
  $(abspath $(SDK_ROOT)/components/libraries/atomic/nrf_atomic.c) \
  $(abspath $(SDK_ROOT)/components/libraries/balloc/nrf_balloc.c) \
  $(abspath $(SDK_ROOT)/external/fprintf/nrf_fprintf.c) \
  $(abspath $(SDK_ROOT)/external/fprintf/nrf_fprintf_format.c) \
  $(abspath $(SDK_ROOT)/components/libraries/memobj/nrf_memobj.c) \
  $(abspath $(SDK_ROOT)/components/libraries/pwr_mgmt/nrf_pwr_mgmt.c) \
  $(abspath $(SDK_ROOT)/components/libraries/ringbuf/nrf_ringbuf.c) \
  $(abspath $(SDK_ROOT)/components/libraries/experimental_section_vars/nrf_section_iter.c) \
  $(abspath $(SDK_ROOT)/components/libraries/strerror/nrf_strerror.c) \
  $(abspath $(SDK_ROOT)/modules/nrfx/mdk/system_nrf52.c) \
  $(abspath $(SDK_ROOT)/components/boards/boards.c) \
  $(abspath $(SDK_ROOT)/integration/nrfx/legacy/nrf_drv_clock.c) \
  $(abspath $(SDK_ROOT)/integration/nrfx/legacy/nrf_drv_uart.c) \
  $(abspath $(SDK_ROOT)/modules/nrfx/soc/nrfx_atomic.c) \
  $(abspath $(SDK_ROOT)/modules/nrfx/drivers/src/nrfx_clock.c) \
  $(abspath $(SDK_ROOT)/modules/nrfx/drivers/src/nrfx_gpiote.c) \
  $(abspath $(SDK_ROOT)/modules/nrfx/drivers/src/prs/nrfx_prs.c) \
  $(abspath $(SDK_ROOT)/modules/nrfx/drivers/src/nrfx_uart.c) \
  $(abspath $(SDK_ROOT)/modules/nrfx/drivers/src/nrfx_uarte.c) \
  $(abspath $(SDK_ROOT)/components/libraries/bsp/bsp.c) \
  $(abspath $(SDK_ROOT)/components/libraries/bsp/bsp_btn_ble.c) \
  $(abspath $(PROJ_DIR)/src/flashwrite.c) \
  $(abspath $(PROJ_DIR)/src/our_service.c) \
  $(abspath $(PROJ_DIR)/src/main.c) \
  $(abspath $(SDK_ROOT)/external/segger_rtt/SEGGER_RTT.c) \
  $(abspath $(SDK_ROOT)/external/segger_rtt/SEGGER_RTT_Syscalls_GCC.c) \
  $(abspath $(SDK_ROOT)/external/segger_rtt/SEGGER_RTT_printf.c) \
  $(abspath $(SDK_ROOT)/components/ble/common/ble_advdata.c) \
  $(abspath $(SDK_ROOT)/components/ble/ble_advertising/ble_advertising.c) \
  $(abspath $(SDK_ROOT)/components/ble/common/ble_conn_state.c) \
  $(abspath $(SDK_ROOT)/components/ble/ble_db_discovery/ble_db_discovery.c) \
  $(abspath $(SDK_ROOT)/components/ble/common/ble_srv_common.c) \
  $(abspath $(SDK_ROOT)/components/ble/nrf_ble_gatt/nrf_ble_gatt.c) \
  $(abspath $(SDK_ROOT)/components/ble/nrf_ble_scan/nrf_ble_scan.c) \
  $(abspath $(SDK_ROOT)/external/utf_converter/utf.c) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_lbs_c/ble_lbs_c.c) \
  $(abspath $(SDK_ROOT)/components/softdevice/common/nrf_sdh.c) \
  $(abspath $(SDK_ROOT)/components/softdevice/common/nrf_sdh_ble.c) \
  $(abspath $(SDK_ROOT)/components/softdevice/common/nrf_sdh_soc.c) \

# Include folders common to all targets
INC_FOLDERS += \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/generic/message) \
  $(abspath $(SDK_ROOT)/components/nfc/t2t_lib) \
  $(abspath $(SDK_ROOT)/components/nfc/t4t_parser/hl_detection_procedure) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_ancs_c) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_ias_c) \
  $(abspath $(SDK_ROOT)/components/libraries/pwm) \
  $(abspath $(SDK_ROOT)/components/softdevice/s132/headers/nrf52) \
  $(abspath $(SDK_ROOT)/components/libraries/usbd/class/cdc/acm) \
  $(abspath $(SDK_ROOT)/components/libraries/usbd/class/hid/generic) \
  $(abspath $(SDK_ROOT)/components/libraries/usbd/class/msc) \
  $(abspath $(SDK_ROOT)/components/libraries/usbd/class/hid) \
  $(abspath $(SDK_ROOT)/modules/nrfx/hal) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/conn_hand_parser/le_oob_rec_parser) \
  $(abspath $(SDK_ROOT)/components/libraries/log) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_gls) \
  $(abspath $(SDK_ROOT)/components/libraries/fstorage) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/text) \
  $(abspath $(SDK_ROOT)/components/libraries/mutex) \
  $(abspath $(SDK_ROOT)/components/libraries/gpiote) \
  $(abspath $(SDK_ROOT)/components/libraries/bootloader/ble_dfu) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/connection_handover/common) \
  $(abspath $(SDK_ROOT)/components/boards) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/generic/record) \
  $(abspath $(SDK_ROOT)/components/nfc/t4t_parser/cc_file) \
  $(abspath $(SDK_ROOT)/components/ble/ble_advertising) \
  $(abspath $(SDK_ROOT)/external/utf_converter) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_bas_c) \
  $(abspath $(SDK_ROOT)/modules/nrfx/drivers/include) \
  $(abspath $(SDK_ROOT)/components/libraries/experimental_task_manager) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_hrs_c) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/connection_handover/le_oob_rec) \
  $(abspath $(SDK_ROOT)/components/libraries/queue) \
  $(abspath $(SDK_ROOT)/components/libraries/pwr_mgmt) \
  $(abspath $(SDK_ROOT)/components/ble/ble_dtm) \
  $(abspath $(SDK_ROOT)/components/toolchain/cmsis/include) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_rscs_c) \
  $(abspath $(SDK_ROOT)/components/ble/common) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_lls) \
  $(abspath $(SDK_ROOT)/components/libraries/bsp) \
  $(abspath $(SDK_ROOT)/components/ble/ble_db_discovery) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/connection_handover/ac_rec) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_bas) \
  $(abspath $(SDK_ROOT)/components/libraries/mpu) \
  $(abspath $(SDK_ROOT)/components/libraries/experimental_section_vars) \
  $(abspath $(SDK_ROOT)/components/softdevice/s132/headers) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_ans_c) \
  $(abspath $(SDK_ROOT)/components/libraries/slip) \
  $(abspath $(SDK_ROOT)/components/libraries/delay) \
  $(abspath $(SDK_ROOT)/components/libraries/csense_drv) \
  $(abspath $(SDK_ROOT)/components/libraries/memobj) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_nus_c) \
  $(abspath $(SDK_ROOT)/components/softdevice/common) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_ias) \
  $(abspath $(SDK_ROOT)/components/libraries/usbd/class/hid/mouse) \
  $(abspath $(SDK_ROOT)/components/libraries/ecc) \
  $(abspath $(SDK_ROOT)/components/ble/nrf_ble_scan) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/conn_hand_parser/ble_oob_advdata_parser) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_dfu) \
  $(abspath $(SDK_ROOT)/external/fprintf) \
  $(abspath $(SDK_ROOT)/components/libraries/svc) \
  $(abspath $(SDK_ROOT)/components/libraries/atomic) \
  $(abspath $(SDK_ROOT)/components) \
  $(abspath $(SDK_ROOT)/components/libraries/scheduler) \
  $(abspath $(SDK_ROOT)/components/libraries/cli) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_lbs) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_hts) \
  $(abspath $(SDK_ROOT)/components/libraries/crc16) \
  $(abspath $(SDK_ROOT)/components/nfc/t4t_parser/apdu) \
  $(abspath $(SDK_ROOT)/components/libraries/util) \
  ../config \
  $(abspath $(SDK_ROOT)/components/libraries/usbd/class/cdc) \
  $(abspath $(SDK_ROOT)/components/libraries/csense) \
  $(abspath $(SDK_ROOT)/components/libraries/balloc) \
  $(abspath $(SDK_ROOT)/components/libraries/low_power_pwm) \
  $(abspath $(SDK_ROOT)/components/libraries/hardfault) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_cscs) \
  $(abspath $(SDK_ROOT)/components/libraries/hci) \
  $(abspath $(SDK_ROOT)/components/libraries/usbd/class/hid/kbd) \
  $(abspath $(SDK_ROOT)/components/libraries/timer) \
  $(abspath $(SDK_ROOT)/integration/nrfx) \
  $(abspath $(SDK_ROOT)/components/nfc/t4t_parser/tlv) \
  $(abspath $(SDK_ROOT)/components/libraries/sortlist) \
  $(abspath $(SDK_ROOT)/components/libraries/spi_mngr) \
  $(abspath $(SDK_ROOT)/components/libraries/led_softblink) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/conn_hand_parser) \
  $(abspath $(SDK_ROOT)/components/libraries/sdcard) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/parser/record) \
  $(abspath $(SDK_ROOT)/modules/nrfx/mdk) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_cts_c) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_nus) \
  $(abspath $(SDK_ROOT)/components/libraries/twi_mngr) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_hids) \
  $(abspath $(SDK_ROOT)/components/libraries/strerror) \
  $(abspath $(SDK_ROOT)/components/libraries/crc32) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/connection_handover/ble_oob_advdata) \
  $(abspath $(SDK_ROOT)/components/nfc/t2t_parser) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/connection_handover/ble_pair_msg) \
  $(abspath $(SDK_ROOT)/components/libraries/usbd/class/audio) \
  $(abspath $(SDK_ROOT)/components/nfc/t4t_lib) \
  $(abspath $(SDK_ROOT)/components/ble/peer_manager) \
  $(abspath $(SDK_ROOT)/components/libraries/mem_manager) \
  $(abspath $(SDK_ROOT)/components/libraries/ringbuf) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_tps) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/parser/message) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_dis) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/uri) \
  $(abspath $(SDK_ROOT)/components/ble/nrf_ble_gatt) \
  $(abspath $(SDK_ROOT)/components/ble/nrf_ble_qwr) \
  $(abspath $(SDK_ROOT)/components/libraries/gfx) \
  $(abspath $(SDK_ROOT)/components/libraries/button) \
  $(abspath $(SDK_ROOT)/modules/nrfx) \
  $(abspath $(SDK_ROOT)/components/libraries/twi_sensor) \
  $(abspath $(SDK_ROOT)/integration/nrfx/legacy) \
  $(abspath $(SDK_ROOT)/components/libraries/usbd) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/connection_handover/ep_oob_rec) \
  $(abspath $(SDK_ROOT)/external/segger_rtt) \
  $(abspath $(SDK_ROOT)/components/libraries/atomic_fifo) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_lbs_c) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/connection_handover/ble_pair_lib) \
  $(abspath $(SDK_ROOT)/components/libraries/crypto) \
  $(abspath $(SDK_ROOT)/components/ble/ble_racp) \
  $(abspath $(SDK_ROOT)/components/libraries/fds) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/launchapp) \
  $(abspath $(SDK_ROOT)/components/libraries/atomic_flags) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_hrs) \
  $(abspath $(SDK_ROOT)/components/ble/ble_services/ble_rscs) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/connection_handover/hs_rec) \
  $(abspath $(SDK_ROOT)/components/nfc/ndef/conn_hand_parser/ac_rec_parser) \
  $(abspath $(SDK_ROOT)/components/libraries/stack_guard) \
  $(abspath $(SDK_ROOT)/components/libraries/log/src) \

# Libraries common to all targets
LIB_FILES += \

# Optimization flags
OPT = -O3 -g3
# Uncomment the line below to enable link time optimization
#OPT += -flto

# C flags common to all targets
CFLAGS += $(OPT)
CFLAGS += -DBOARD_PCA10040
CFLAGS += -DCONFIG_GPIO_AS_PINRESET
CFLAGS += -DFLOAT_ABI_HARD
CFLAGS += -DNRF52
CFLAGS += -DNRF52832_XXAA
CFLAGS += -DNRF52_PAN_74
CFLAGS += -DNRF_SD_BLE_API_VERSION=6
CFLAGS += -DS132
CFLAGS += -DSOFTDEVICE_PRESENT
CFLAGS += -DSWI_DISABLE0
CFLAGS += -mcpu=cortex-m4
CFLAGS += -mthumb -mabi=aapcs
CFLAGS += -Wall -Werror
CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
# keep every function in a separate section, this allows linker to discard unused ones
CFLAGS += -ffunction-sections -fdata-sections -fno-strict-aliasing
CFLAGS += -fno-builtin -fshort-enums

# C++ flags common to all targets
CXXFLAGS += $(OPT)

# Assembler flags common to all targets
ASMFLAGS += -g3
ASMFLAGS += -mcpu=cortex-m4
ASMFLAGS += -mthumb -mabi=aapcs
ASMFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
ASMFLAGS += -DBOARD_PCA10040
ASMFLAGS += -DCONFIG_GPIO_AS_PINRESET
ASMFLAGS += -DFLOAT_ABI_HARD
ASMFLAGS += -DNRF52
ASMFLAGS += -DNRF52832_XXAA
ASMFLAGS += -DNRF52_PAN_74
ASMFLAGS += -DNRF_SD_BLE_API_VERSION=6
ASMFLAGS += -DS132
ASMFLAGS += -DSOFTDEVICE_PRESENT
ASMFLAGS += -DSWI_DISABLE0

# Linker flags
LDFLAGS += $(OPT)
LDFLAGS += -mthumb -mabi=aapcs -L$(SDK_ROOT)/modules/nrfx/mdk -T$(LINKER_SCRIPT)
LDFLAGS += -mcpu=cortex-m4
LDFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
# let linker dump unused sections
LDFLAGS += -Wl,--gc-sections
# use newlib in nano version
LDFLAGS += --specs=nano.specs

nrf52832_xxaa: CFLAGS += -D__HEAP_SIZE=0
nrf52832_xxaa: CFLAGS += -D__STACK_SIZE=8192
nrf52832_xxaa: ASMFLAGS += -D__HEAP_SIZE=0
nrf52832_xxaa: ASMFLAGS += -D__STACK_SIZE=8192

# Add standard libraries at the very end of the linker input, after all objects
# that may need symbols provided by these libraries.
LIB_FILES += -lc -lnosys -lm


.PHONY: default help

# Default target - first one defined
default: nrf52832_xxaa

# Print all targets that can be built
help:
	@echo following targets are available:
	@echo		nrf52832_xxaa
	@echo		flash_softdevice
	@echo		sdk_config - starting external tool for editing sdk_config.h
	@echo		flash      - flashing binary

TEMPLATE_PATH := $(SDK_ROOT)/components/toolchain/gcc


include $(TEMPLATE_PATH)/Makefile.common

$(foreach target, $(TARGETS), $(call define_target, $(target)))

.PHONY: flash flash_softdevice erase

# Flash the program
flash: default
	@echo Flashing: $(OUTPUT_DIRECTORY)/nrf52832_xxaa.hex
	nrfjprog -f nrf52 --program $(OUTPUT_DIRECTORY)/nrf52832_xxaa.hex --sectorerase
	nrfjprog -f nrf52 --reset

# Flash softdevice
flash_softdevice:
	@echo Flashing: s132_nrf52_6.1.1_softdevice.hex
	nrfjprog -f nrf52 --program $(SDK_ROOT)/components/softdevice/s132/hex/s132_nrf52_6.1.1_softdevice.hex --sectorerase
	nrfjprog -f nrf52 --reset

erase:
	nrfjprog -f nrf52 --eraseall

SDK_CONFIG_FILE := ../config/sdk_config.h
CMSIS_CONFIG_TOOL := $(SDK_ROOT)/external_tools/cmsisconfig/CMSIS_Configuration_Wizard.jar
sdk_config:
	java -jar $(CMSIS_CONFIG_TOOL) $(SDK_CONFIG_FILE)
