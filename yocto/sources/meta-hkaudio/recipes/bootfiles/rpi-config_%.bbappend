FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://config.txt"

do_deploy:append() {
    cp ${WORKDIR}/config.txt $CONFIG
}
