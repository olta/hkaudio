FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://wpa_supplicant_eg.conf \
    file://wpa_supplicant_og.conf \
    file://wpa_supplicant_wz.conf \
    file://wpa_supplicant.service \
"

FILES:${PN} += "/usr/lib/systemd/system-preset"

SYSTEMD_SERVICE:${PN} = "wpa_supplicant.service"
SYSTEMD_AUTO_ENABLE = "enable"

do_install:append() {
    # remove network configuration - it will be symlinked at runtime:
    rm -f ${D}/etc/wpa_supplicant.conf
    for f in eg og wz; do
        install -m 0600 ${WORKDIR}/wpa_supplicant_${f}.conf ${D}/${sysconfdir}/
    done
    
    install -d ${D}/${systemd_system_unitdir}
    rm -f ${D}/${systemd_system_unitdir}/wpa_supplicant*.service
    install -m 644 ${WORKDIR}/wpa_supplicant.service ${D}/${systemd_system_unitdir}
}
