SUMMARY = "golibrespot - a Spotify client, written in Go"
HOMEPAGE = "https://github.com/devgianlu/go-librespot"
LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=02f117cb774083d3ae16e938a01319c7"

COMPATIBLE_HOST = "aarch64-.*-linux"

GO_IMPORT = "github.com/devgianlu/go-librespot"
GO_INSTALL = "src/${GO_IMPORT}/"

export GO111MODULE="on"

inherit go systemd pkgconfig

SRC_URI = " \
    git://${GO_IMPORT}.git;branch=master;protocol=https \
    file://0001-Add-resource-management-callouts.patch;patchdir=${GO_INSTALL} \
    file://config.yml.in \
    file://go-librespot-config.sh \
    file://go-librespot.service \
    file://ask-go-librespot-to-stop.sh \
    file://do-go-librespot-cmd.sh \
"

SRCREV = "v${PV}"

# network is required by go to get dependent packages
do_compile[network] = "1"

DEPENDS += "alsa-lib libogg libvorbis"

SYSTEMD_SERVICE:${PN} = "${PN}.service"
SYSTEMD_AUTO_ENABLE = "enable"

RDEPENDS:${PN} += "bash"

INSANE_SKIP:${PN} = "buildpaths textrel"
INSANE_SKIP:${PN}-dbg = "buildpaths textrel"
INSANE_SKIP:${PN}-dev = "buildpaths textrel"

go_do_compile:prepend() {
    cd ${GO_INSTALL}
    $GO mod download -json
    $GO build -v ./cmd/daemon

    # make files in pkg dir writeable again so things like "bitbake -c clean" will work.
    chmod u+w -R ${WORKDIR}/build/pkg/mod
}

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 ${GO_INSTALL}/daemon ${D}${bindir}/${PN}
    install -m 0755 ${WORKDIR}/${PN}-config.sh ${D}${bindir}/
    install -m 0755 ${WORKDIR}/ask-${PN}-to-stop.sh ${D}${bindir}/
    install -m 0755 ${WORKDIR}/do-${PN}-cmd.sh ${D}${bindir}/

    install -d ${D}${sysconfdir}/${PN}
    install -m 0644 ${WORKDIR}/config.yml.in ${D}${sysconfdir}/${PN}/

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_system_unitdir}/
}
