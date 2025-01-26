FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://asound_daczero.conf \
    file://asound_miniamp.conf \
"

FILES:${PN} += "${sysconfdir}"

do_install:append() {
    rm -f ${D}/${sysconfdir}/asound.conf
    install -m 644 ${WORKDIR}/asound_daczero.conf ${D}/${sysconfdir}/
    install -m 644 ${WORKDIR}/asound_miniamp.conf ${D}/${sysconfdir}/
}
