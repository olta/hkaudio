# SPD-License-Identifier: GPL-3.0-only

SUMMARY = "Lightweight headless squeezebox player for Logitech Media Server"
HOMEPAGE = "https://github.com/ralph-irving/squeezelite/"
SECTION = "console/utils"

LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=92e543e1d0236f609af745ec42dfb4e1"

DEPENDS = " \
    alsa-lib \
    faad2 \
    flac \
    libmad \
    libvorbis \
    mpg123 \
"

SRCREV = "72e1fd8abfa9b2f8e9636f033247526920878718"

SRC_URI = " \
    git://github.com/ralph-irving/squeezelite.git;protocol=http;branch=master \
    file://0001-Add-resource-management-callouts.patch \
    file://squeezelite.service \
    file://ask-squeezelite-to-stop.sh \
    file://do-squeeze-cmd.sh \
"

S = "${WORKDIR}/git"

inherit systemd

SYSTEMD_SERVICE:${PN} = "${PN}.service"
SYSTEMD_AUTO_ENABLE = "enable"

RDEPENDS:${PN} += "bash faad2 flac libmad libvorbis mpg123"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${B}/squeezelite ${D}${bindir}/
    install -m 0755 ${WORKDIR}/ask-squeezelite-to-stop.sh ${D}${bindir}/
    install -m 0755 ${WORKDIR}/do-squeeze-cmd.sh ${D}${bindir}/

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_system_unitdir}/
}
