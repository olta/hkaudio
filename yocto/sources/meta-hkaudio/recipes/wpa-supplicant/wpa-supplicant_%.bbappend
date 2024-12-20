FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://secrets \
    file://wpa_supplicant.conf-sane \
    file://wpa_supplicant.service \
"

FILES:${PN} += "/usr/lib/systemd/system-preset"

SYSTEMD_SERVICE:${PN} = "wpa_supplicant.service"
SYSTEMD_AUTO_ENABLE = "enable"

do_install:append() {
    # inject actual network configuration (containing SSID and PSK) into configuration:
    cat ${WORKDIR}/secrets >>${D}/etc/wpa_supplicant.conf
    
    install -d ${D}/${systemd_system_unitdir}
    rm -f ${D}/${systemd_system_unitdir}/wpa_supplicant*.service
    install -m 644 ${WORKDIR}/wpa_supplicant.service ${D}/${systemd_system_unitdir}
}
