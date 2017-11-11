#include <stdbool.h>
#include <stdint.h>
//#include <string.h>

#include "nrf_gpio.h"
#include "nrf_delay.h"


/**@brief Function for application main entry.
 */
int main(void) {

    nrf_gpio_cfg_output(17);
    nrf_gpio_cfg_output(19);
    nrf_gpio_pin_write(17, 1);
    nrf_gpio_pin_write(19, 1);

    /* Toggle LEDs. */
    while (true)
    {
        nrf_gpio_pin_write(17, 1);
        nrf_gpio_pin_write(19, 0);
        nrf_delay_ms(500);
        nrf_gpio_pin_write(17, 0);
        nrf_gpio_pin_write(19, 1);
        nrf_delay_ms(500);
    }
}
