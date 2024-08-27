#include "esp32/rom/ets_sys.h"
#include "driver/gpio.h"
#include "driver/uart.h"

#define LED_PIN GPIO_NUM_2

void delay_ms(int ms) {
    ets_delay_us(ms * 1000);
}

void init_led() {
    gpio_pad_select_gpio(LED_PIN);
    gpio_set_direction(LED_PIN, GPIO_MODE_OUTPUT);
}

void blink_led() {
    gpio_set_level(LED_PIN, 1);
    delay_ms(500);
    gpio_set_level(LED_PIN, 0);
    delay_ms(500);
}

void init_uart() {
    const uart_config_t uart_config = {
        .baud_rate = 115200,
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE
    };
    uart_param_config(UART_NUM_0, &uart_config);
    uart_driver_install(UART_NUM_0, 1024, 0, 0, NULL, 0);
}

void uart_print(const char* message) {
    uart_write_bytes(UART_NUM_0, message, strlen(message));
}

void main() {
    init_led();
    init_uart();
    uart_print("Simple OS starting...\n");

    while (1) {
        blink_led();
        uart_print("LED Blinked!\n");
    }
}
