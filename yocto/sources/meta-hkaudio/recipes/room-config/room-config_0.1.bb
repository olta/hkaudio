SUMMARY = "room configuration"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI += " \
    file://000000000f503ddc.config \
    file://00000000a6b47c15.config \
    file://00000000d113b195.config \
    file://00000000ecfbbddc.config \
    file://00000000ef345817.config \
    file://${PN}.service \
    file://${PN}.sh \
"

S = "${WORKDIR}"

inherit systemd

SYSTEMD_SERVICE:${PN} = "${PN}.service"
SYSTEMD_AUTO_ENABLE = "enable"

RDEPENDS:${PN} += "bash"

do_install() {
    install -d ${D}/${sysconfdir}/room-config
    for f in ${WORKDIR}/*.config; do
        install -m 644 $f ${D}/${sysconfdir}/room-config/
    done
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_system_unitdir}/
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/${PN}.sh ${D}${bindir}/
}
