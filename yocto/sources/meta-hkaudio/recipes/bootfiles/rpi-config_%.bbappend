ENABLE_UART = "1"

do_deploy:append() {
    echo 'dtparam=act_led_trigger=none\ndtparam=act_led_activelow=on' >> $CONFIG
    echo 'dtoverlay=hifiberry-dac' >> $CONFIG
    if [ '${HKAUDIO_LIRC}' = '1' ]; then
        echo 'dtoverlay=gpio-ir,gpio_pin=17,gpio_pull=down' >> $CONFIG
    fi
}
