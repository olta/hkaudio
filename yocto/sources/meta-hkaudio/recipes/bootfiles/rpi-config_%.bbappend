ENABLE_UART = "1"

do_deploy:append() {
    echo "dtoverlay=hifiberry-dac" >> $CONFIG
}
