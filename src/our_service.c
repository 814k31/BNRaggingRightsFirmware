#include <stdint.h>
#include <string.h>
#include "nrf_gpio.h"
#include "our_service.h"
#include "ble_srv_common.h"
#include "app_error.h"
#include "SEGGER_RTT.h"
#include "flashwrite.h"

static void notify_char_update(ble_os_t *p_our_service, int32_t *value) {
    if (p_our_service->conn_handle != BLE_CONN_HANDLE_INVALID) {
        uint16_t length = 4;
        uint8_t testValue = 0x0123BABE;
        ble_gatts_hvx_params_t hvx_params;

        memset(&hvx_params, 0, sizeof(hvx_params));
        hvx_params.handle = p_our_service->char_handles.value_handle;
        hvx_params.type   = BLE_GATT_HVX_NOTIFICATION;
        hvx_params.offset = 0;
        hvx_params.p_len  = &length;
        hvx_params.p_data = testValue;
        // hvx_params.p_data = foodValue;

        sd_ble_gatts_hvx(p_our_service->conn_handle, &hvx_params);
    }
}

static void char_write(ble_os_t* p_sws, uint8_t* data, uint16_t length) {
    // validate
    if (length < 1) {
        // SWS_PRINTF(RTT_ERROR_TEXT_DECORATOR("Bad data") + "\n");
        return;
    }

    // uint8_t u8cmd = (data[0]);
    uint8_t* p_data = &data[0];

    // SWS_PRINTF("CALIB_CTRL_CMD_P0_WRITE\n");
    uint32_t d_data = 0;
    memcpy(&d_data, &p_data[0], sizeof(d_data));

    // flash_word_write(uint32_t* address, uint32_t value);
    // notify_char_update(p_sws, value);

}

// Function for adding our new characterstic to "Our service" that we initiated in the previous tutorial.
// p_our_service Our Service structure.
static uint32_t our_char_add(ble_os_t* p_our_service) {
    uint32_t err_code;
    ble_uuid_t char_uuid;
    ble_uuid128_t base_uuid = BLE_UUID_OUR_BASE_UUID;
    // Add a custom characteristic UUID
    char_uuid.uuid = BLE_UUID_OUR_CHARACTERISTC_UUID;
    err_code = sd_ble_uuid_vs_add(&base_uuid, &char_uuid.type);
    APP_ERROR_CHECK(err_code);
    uint8_t value[4] = {0xCA,0xFE,0xBA,0xBE};

    ble_gatts_char_md_t char_md;
    memset(&char_md, 0, sizeof(char_md));
    // Add read/write properties to our characteristic
    char_md.char_props.read = 1;
    char_md.char_props.write = 1;

    // Configuring Client Characteristic Configuration Descriptor metadata and add to char_md structure
    ble_gatts_attr_md_t cccd_md;
    memset(&cccd_md, 0, sizeof(cccd_md));
    BLE_GAP_CONN_SEC_MODE_SET_OPEN(&cccd_md.read_perm);
    BLE_GAP_CONN_SEC_MODE_SET_OPEN(&cccd_md.write_perm);
    cccd_md.vloc = BLE_GATTS_VLOC_STACK;
    char_md.p_cccd_md  = &cccd_md;
    char_md.char_props.notify = 1;

    // Configure the attribute metadata
    ble_gatts_attr_md_t attr_md;
    memset(&attr_md, 0, sizeof(attr_md));
    attr_md.vloc = BLE_GATTS_VLOC_STACK;

    // Set read/write security levels to our characteristic
    BLE_GAP_CONN_SEC_MODE_SET_OPEN(&attr_md.read_perm);
    BLE_GAP_CONN_SEC_MODE_SET_OPEN(&attr_md.write_perm);
    
    // Configure the characteristic value attribute
    ble_gatts_attr_t attr_char_value;
    memset(&attr_char_value, 0, sizeof(attr_char_value));
    attr_char_value.p_uuid = &char_uuid;
    attr_char_value.p_attr_md = &attr_md;

    // Set characteristic length in number of bytes
    attr_char_value.max_len = 4;
    attr_char_value.init_len = 4;
    // SEGGER_RTT_printf(0, "FoodValue: 0x%x\n\n\n\n", foodValue);
    attr_char_value.p_value = value;

    SEGGER_RTT_printf(0, "p_value: 0x%x\n\n\n\n", attr_char_value.p_value);
    // Add our new characteristic to the service
    err_code = sd_ble_gatts_characteristic_add(
        p_our_service->service_handle,
        &char_md,
        &attr_char_value,
        &p_our_service->char_handles
    );
    APP_ERROR_CHECK(err_code);

    return NRF_SUCCESS;
}

void ble_our_service_on_ble_evt(ble_os_t* p_our_service, ble_evt_t* p_ble_evt) {
    SEGGER_RTT_printf(0, "ble_our_service_on_ble_evt\n\n");
    switch (p_ble_evt->header.evt_id) {
        case BLE_GAP_EVT_CONNECTED:
            p_our_service->conn_handle = p_ble_evt->evt.gap_evt.conn_handle;
            break;
        case BLE_GAP_EVT_DISCONNECTED:
            p_our_service->conn_handle = BLE_CONN_HANDLE_INVALID;
            break;
        case BLE_GATTS_EVT_WRITE:
            SEGGER_RTT_printf(0, "BLE_GATTS_EVT_WRITE 0x%02x\n", p_ble_evt->evt.gatts_evt.params.write.handle);
            on_write(p_our_service, p_ble_evt);
            break;

        case BLE_GATTS_EVT_HVC:
            SEGGER_RTT_printf(0, "BLE_GATTS_EVT_HVC\n");
            break;
            /*      sd_ble_gattc_char_value_by_uuid_read(p_sws->conn_handle,p_ble_evt->evt.gap_)
            /**< Write operation performed. @ref ble_gatts_evt_write_t */
        case BLE_GATTS_EVT_RW_AUTHORIZE_REQUEST: /**< Read/Write Authorization request.@ref ble_gatts_evt_rw_authorize_request_t */
            SEGGER_RTT_printf(0, "BLE_GATTS_EVT_RW_AUTHORIZE_REQUEST\n");
            break;
        case BLE_GATTS_EVT_SYS_ATTR_MISSING: /**< A persistent system attribute access is pending: awaiting a sd_ble_gatts_sys_attr_set(). @ref ble_gatts_evt_sys_attr_missing_t */
            SEGGER_RTT_printf(0, "BLE_GATTS_EVT_SYS_ATTR_MISSING\n");
            break;
        case BLE_GATTS_EVT_SC_CONFIRM: /**< Service Changed Confirmation. No additional event structure applies. */
            SEGGER_RTT_printf(0, "BLE_GATTS_EVT_SC_CONFIRM\n");
            break;
        case BLE_GATTS_EVT_TIMEOUT: /**< Timeout. @ref ble_gatts_evt_timeout_t */
            SEGGER_RTT_printf(0, "BLE_GATTS_EVT_TIMEOUT\n");
            break;
        default:
            // No implementation needed.
            break;
    }
}


void on_write(ble_os_t* p_sws, ble_evt_t* p_ble_evt) {
    SEGGER_RTT_printf(0, "value handles!!! 0x%02x, 0x%02x\n", p_ble_evt->evt.gatts_evt.params.write.handle, p_sws->char_handles.value_handle);

    ble_gatts_evt_write_t* p_evt_write = &p_ble_evt->evt.gatts_evt.params.write;

    if (p_evt_write->handle == p_sws->char_handles.value_handle) {
        char_write(p_sws, p_evt_write->data, p_evt_write->len);
    }
    /*else if (p_evt_write->handle == p_sws->local_name_char_handles.value_handle) {
        on_local_name_char_write(p_sws, p_evt_write->data, p_evt_write->len);
    }
    else if (p_evt_write->handle == p_sws->raw_values_char_handles.value_handle)
        {
            on_raw_values_char_write(p_sws, p_evt_write->data, p_evt_write->len);
        }
    else if (p_evt_write->handle == p_sws->general_purpose_char_handles.value_handle)
        {
            // The app sends a battery update every 10 sec
            // so we can reset the activity timer here.
            // If we ever change this, use the CALIB_CTRL_CMD_RESET_ACTIVITY_TIMER
            // opcode on the calib/ctrl char to reset the timer.
            shockwiz_service_make_request(SS_REQ_RESET_ACTIVITY_TIMER);
            on_general_purpose_char_write(p_sws, p_evt_write->data, p_evt_write->len);
        }

#ifdef DEBUG_ENABLE_UNIT_TESTS_BLE_SERVICE
    else if (p_evt_write->handle == p_sws->test_mode_command_char_handles.value_handle)
        {
            on_test_mode_command_char_write(p_sws, p_evt_write->data, p_evt_write->len);
        }
#endif*/
}

// Sends notification with updated temperature
void our_termperature_characteristic_update(ble_os_t* p_our_service, int32_t* temperature_value) {
    if (p_our_service->conn_handle != BLE_CONN_HANDLE_INVALID) {
        uint16_t length = 4;
        ble_gatts_hvx_params_t hvx_params;
        memset(&hvx_params, 0, sizeof(hvx_params));

        hvx_params.handle = p_our_service->char_handles.value_handle;
        hvx_params.type = BLE_GATT_HVX_NOTIFICATION;
        hvx_params.offset = 0;
        hvx_params.p_len = &length;
        hvx_params.p_data = (uint8_t*) temperature_value;
        sd_ble_gatts_hvx(p_our_service->conn_handle, &hvx_params);
    }
}

// Function for initiating our new service.
// p_our_service        Our Service structure.
void our_service_init(ble_os_t* p_our_service) {
    // STEP 3: Declare 16 bit service and 128 bit base UUIDs and add them to BLE stack table     
    uint32_t err_code;
    ble_uuid_t service_uuid;
    ble_uuid128_t base_uuid = BLE_UUID_OUR_BASE_UUID;
    service_uuid.uuid = BLE_UUID_OUR_SERVICE;
    err_code = sd_ble_uuid_vs_add(&base_uuid, &service_uuid.type);
    APP_ERROR_CHECK(err_code);

    p_our_service->conn_handle = BLE_CONN_HANDLE_INVALID;

    // STEP 4: Add our service
    err_code = sd_ble_gatts_service_add(
        BLE_GATTS_SRVC_TYPE_PRIMARY,
        &service_uuid,
        &p_our_service->service_handle
    );

    APP_ERROR_CHECK(err_code);

    our_char_add(p_our_service);

    // Print messages to Segger Real Time Terminal
    // UNCOMMENT THE FOUR LINES BELOW AFTER INITIALIZING THE SERVICE OR THE EXAMPLE WILL NOT COMPILE.
    SEGGER_RTT_WriteString(0, "Exectuing our_service_init().\n"); // Print message to RTT to the application flow
    SEGGER_RTT_printf(0, "Service UUID: 0x%#04x\n", service_uuid.uuid); // Print service UUID should match definition BLE_UUID_OUR_SERVICE
    SEGGER_RTT_printf(0, "Service UUID type: 0x%#02x\n", service_uuid.type); // Print UUID type. Should match BLE_UUID_TYPE_VENDOR_BEGIN. Search for BLE_UUID_TYPES in ble_types.h for more info
    SEGGER_RTT_printf(0, "Service handle: 0x%#04x\n", p_our_service->service_handle); // Print out the service handle. Should match service handle shown in MCP under Attribute values
}

void printFoodValue() {
    // SEGGER_RTT_printf(0, "FoodValue: 0x%#04x\n", foodValue);
    SEGGER_RTT_printf(0, "foodValue %04x", (unsigned int) foodValue[1] | (unsigned int) foodValue[0] << 8);
    SEGGER_RTT_printf(0, "%04x\n", (unsigned int) foodValue[3] | (unsigned int) foodValue[2] << 8);
}
