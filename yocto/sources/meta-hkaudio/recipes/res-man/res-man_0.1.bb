SUMMARY = "resource manager for (ALSA) soundcard"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI += "file://res-man.sh"

S = "${WORKDIR}"

RDEPENDS:${PN} += "bash"

do_install:append() {
    install -d ${D}/${bindir}
    install -m 755 ${WORKDIR}/res-man.sh ${D}/${bindir}
}
