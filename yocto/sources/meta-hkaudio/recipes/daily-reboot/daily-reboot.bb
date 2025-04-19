SUMMARY = "daily reboot service"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI += " \
    file://daily-reboot.timer \
"

inherit systemd

SYSTEMD_SERVICE:${PN} = "${PN}.timer"
SYSTEMD_AUTO_ENABLE = "enable"

do_install() {
    install -d ${D}/${systemd_system_unitdir}
    install -m 644 ${WORKDIR}/daily-reboot.timer ${D}/${systemd_system_unitdir}/
}
