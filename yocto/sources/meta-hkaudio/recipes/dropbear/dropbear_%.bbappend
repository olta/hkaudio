FILESEXTRAPATHS:prepend := "${THISDIR}/hostkeys:"

SRC_URI += " \
    file://badezimmer_rsa_host_key \
    file://heike_rsa_host_key \
    file://kueche_rsa_host_key \
    file://oliver_rsa_host_key \
    file://wohnzimmer_rsa_host_key \
"

FILES:${PN} += "${sysconfdir}/dropbear"

do_install:append() {
    install -d ${D}/${sysconfdir}/dropbear
    for f in badezimmer heike kueche oliver wohnzimmer; do
        install -m 600 ${WORKDIR}/${f}_rsa_host_key ${D}/${sysconfdir}/dropbear/
    done
}
