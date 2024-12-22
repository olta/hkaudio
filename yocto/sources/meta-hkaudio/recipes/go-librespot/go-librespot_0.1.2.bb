SUMMARY = "go-librespot"
HOMEPAGE = "https://github.com/devgianlu/go-librespot"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

COMPATIBLE_HOST = "aarch64-.*-linux"

SRC_URI = "https://github.com/devgianlu/go-librespot/releases/download/v${PV}/go-librespot_linux_arm64.tar.gz"
SRC_URI[sha256sum] = "d04726fb9704d88e026acb02ef8d1e19ef13b395381df74ea7f3007ad2b7a33b"

S = "${WORKDIR}"

DEPENDS += "alsa-lib libogg libvorbis"

#INSANE_SKIP:${PN} = "ldflags"
#INHIBIT_PACKAGE_STRIP = "1"
#INHIBIT_SYSROOT_STRIP = "1"
#INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

do_install () {
        install -m 0755 -d ${D}${bindir}
        install ${S}/go-librespot ${D}${bindir}
}
