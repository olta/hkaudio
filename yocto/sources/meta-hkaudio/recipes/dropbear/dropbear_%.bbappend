FILESEXTRAPATHS:prepend := "${THISDIR}/hostkeys:"

SRC_URI += "file://${HKAUDIO_CONFIG}_rsa_host_key"

FILES:${PN} += "${sysconfdir}/dropbear"

do_install:append() {
    install -d ${D}/${sysconfdir}/dropbear
    install -m 600 ${WORKDIR}/${HKAUDIO_CONFIG}_rsa_host_key ${D}/${sysconfdir}/dropbear/dropbear_rsa_host_key
}
