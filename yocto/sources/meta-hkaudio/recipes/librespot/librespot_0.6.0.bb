SUMMARY = "librespot - a decent Spotify client, written in Rust"
HOMEPAGE = "https://github.com/librespot-org/librespot"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=98b2b0c9a6081259c441045ca68b640f"

inherit cargo cargo-update-recipe-crates systemd

DEPENDS += "alsa-lib pkgconfig-native"

SRC_URI += " \
    git://github.com/librespot-org/librespot;protocol=https;branch=dev \
    file://0001-Fix-build-of-hyper-rustls.patch \
    file://0002-Add-resource-management-callouts.patch \
    file://librespot.service \
    file://ask-librespot-to-stop.sh \
    file://on-librespot-event.sh \
"

SRCREV = "v0.6.0"
S = "${WORKDIR}/git"

require ${BPN}-crates.inc

CARGO_BUILD_FLAGS += "--no-default-features --features 'alsa-backend with-libmdns'"
CARGO_BUILD_FLAGS:remove = "--frozen"

SYSTEMD_SERVICE:${PN} = "librespot.service"
SYSTEMD_AUTO_ENABLE = "enable"

RDEPENDS:${PN} += "bash"

do_install:append() {
    install -d ${D}/${bindir}
    install -m 755 ${WORKDIR}/on-librespot-event.sh ${D}/${bindir}
    install -m 0755 ${WORKDIR}/ask-librespot-to-stop.sh ${D}${bindir}/
    install -d ${D}/${systemd_system_unitdir}
    install -m 644 ${WORKDIR}/librespot.service ${D}/${systemd_system_unitdir}
    sed -i 's/@@HKAUDIO_DEVICENAME@@/${HKAUDIO_DEVICENAME}/g' ${D}/${systemd_system_unitdir}/librespot.service
}
