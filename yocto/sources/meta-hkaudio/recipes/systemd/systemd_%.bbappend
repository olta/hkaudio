FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://.profile \
"

PACKAGECONFIG:remove = "networkd"

FILES:${PN} += "/root"

do_install:append() {
    install -d ${D}/root
    install -m 0644 ${WORKDIR}/.profile ${D}/root
}
