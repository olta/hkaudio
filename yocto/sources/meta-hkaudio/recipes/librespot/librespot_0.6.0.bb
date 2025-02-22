SUMMARY = "librespot - a Spotify client, written in Rust"
HOMEPAGE = "https://github.com/librespot-org/librespot"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=98b2b0c9a6081259c441045ca68b640f"

inherit cargo cargo-update-recipe-crates systemd

DEPENDS += "alsa-lib pkgconfig-native"

SRC_URI += " \
    git://github.com/librespot-org/librespot;protocol=https;branch=dev \
    file://0001-Fix-build-of-hyper-rustls.patch \
    file://0002-Add-resource-management-check.patch \
    file://librespot.service \
    file://ask-librespot-to-stop.sh \
    file://do-librespot-cmd.sh \
    file://on-librespot-event.sh \
"

SRCREV = "v0.6.0"
S = "${WORKDIR}/git"

require ${BPN}-crates.inc

CARGO_BUILD_FLAGS += "--no-default-features --features 'alsa-backend with-libmdns'"
CARGO_BUILD_FLAGS:remove = "--frozen"

INSANE_SKIP:${PN}-dbg = "buildpaths"

SYSTEMD_SERVICE:${PN} = "librespot.service"
SYSTEMD_AUTO_ENABLE = "enable"

RDEPENDS:${PN} += "bash"

do_install:append() {
    install -d ${D}/${bindir}
    install -m 0755 ${WORKDIR}/ask-${PN}-to-stop.sh ${D}${bindir}/
    install -m 0755 ${WORKDIR}/do-${PN}-cmd.sh ${D}${bindir}/
    install -m 0755 ${WORKDIR}/on-${PN}-event.sh ${D}/${bindir}/
    install -d ${D}/${systemd_system_unitdir}
    install -m 644 ${WORKDIR}/${PN}.service ${D}/${systemd_system_unitdir}/
}
