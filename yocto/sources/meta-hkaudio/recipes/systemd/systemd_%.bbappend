FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://.profile \
    file://80-wifi-station.network \
"

FILES:${PN} += "/root"

do_install:append() {
    install -d ${D}/root
    install -m 0644 ${WORKDIR}/.profile ${D}/root

    install -d ${D}/usr/lib/systemd/network
    install -m 0644 ${WORKDIR}/80-wifi-station.network ${D}/usr/lib/systemd/network/
}
