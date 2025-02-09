FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://main.conf \
    file://Hirschkaefer-Airlines.psk \
    file://wait-online.sh \
    file://wait-online.service \
"

FILES:${PN} += "${systemd_system_unitdir}"

SYSTEMD_SERVICE:${PN} += "wait-online.service"

RDEPENDS:${PN} += "bash"

do_install:append() {
    install -d ${D}/${bindir}
    install -m 0755 ${WORKDIR}/wait-online.sh ${D}/${bindir}/
    install -d ${D}/${systemd_system_unitdir}
    install -m 644 ${WORKDIR}/wait-online.service ${D}/${systemd_system_unitdir}/
    install -d ${D}/${sysconfdir}/iwd
    install -m 0644 ${WORKDIR}/main.conf ${D}/${sysconfdir}/iwd/
    install -d ${D}/var/lib/iwd
    install -m 0600 ${WORKDIR}/Hirschkaefer-Airlines.psk ${D}/var/lib/iwd/
}
