FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://asound_${HKAUDIO_ALSA_CONFIG}.conf"

do_install:prepend() {
    # override asound.conf with out version
    cp ${WORKDIR}/asound_${HKAUDIO_ALSA_CONFIG}.conf ${WORKDIR}/asound.conf
}
