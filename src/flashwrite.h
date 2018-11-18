#include <stdbool.h>
#include <stdio.h>
#include "nrf.h"
#include "bsp.h"
#include "app_uart.h"
#include "app_error.h"
#include "nordic_common.h"
#include "nrf_delay.h"
#include "SEGGER_RTT.h"

#define UART_TX_BUF_SIZE 256 /**< UART TX buffer size. */
#define UART_RX_BUF_SIZE 1 /**< UART RX buffer size. */

void uart_error_handle(app_uart_evt_t* p_event);
void flash_page_erase(uint32_t* page_address);
void flash_word_write(uint32_t* address, uint32_t value);
