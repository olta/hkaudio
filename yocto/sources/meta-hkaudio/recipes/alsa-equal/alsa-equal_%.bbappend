FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://alsa-equal.data"

FILES:${PN} += "${sysconfdir}"

do_install:append() {
    install -d ${D}${sysconfdir}
    install -m 644 ${WORKDIR}/alsa-equal.data ${D}${sysconfdir}/
}
