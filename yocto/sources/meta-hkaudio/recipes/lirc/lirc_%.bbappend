FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://do-cmd.sh \
    file://irexec.lircrc \
"

SYSTEMD_SERVICE:${PN}:remove = "lircd.service lircmd.service lircd-setup.service lircd-uinput.service"
SYSTEMD_SERVICE:${PN} += "lircd.socket"

do_install:append() {
    install -d ${D}/${bindir}
    install -m 755 ${WORKDIR}/do-cmd.sh ${D}${bindir}/
    install -m 644 ${WORKDIR}/irexec.lircrc ${D}${sysconfdir}/lirc/
    rm -f ${D}/usr/lib/systemd/system/lircd-uinput.service
    rm -f ${D}/usr/lib/systemd/system/lircmd.service
    rm -f ${D}/usr/lib/systemd/system/lircd-setup.service
}
