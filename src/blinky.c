/* Copyright (c) 2014 Nordic Semiconductor. All Rights Reserved.
 *
 * The information contained herein is property of Nordic Semiconductor ASA.
 * Terms and conditions of usage are described in detail in NORDIC
 * SEMICONDUCTOR STANDARD SOFTWARE LICENSE AGREEMENT.
 *
 * Licensees are granted free, non-transferable use of the information. NO
 * WARRANTY of ANY KIND is provided. This heading must NOT be removed from
 * the file.
 *
 */

/** @file
 *
 * @defgroup blinky_example_main main.c
 * @{
 * @ingroup blinky_example
 * @brief Blinky Example Application main file.
 *
 */

#include <stdbool.h>
#include <stdint.h>
#include "nrf_delay.h"
#include "nrf_gpio.h"
#include "boards.h"

/**
 * @brief Function for application main entry.
 */
int main(void)
{
    nrf_gpio_cfg_output(17);
    nrf_gpio_cfg_output(19);
    
    nrf_gpio_pin_write(17, 0);
    nrf_gpio_pin_write(19, 0);

    // Toggle LEDs.
    while (true)
    {
        nrf_gpio_pin_write(19, 0);
        nrf_delay_ms(100);
        nrf_gpio_pin_write(19, 1);
        nrf_delay_ms(100);
    }
}


/** @} */
