#!/bin/bash

cd /yocto
. sources/poky/oe-init-build-env

cat >>conf/local.conf <<EndOfHere
# device configuration:
hostname:pn-base-files = "$HKAUDIO_HOSTNAME"
HKAUDIO_CONFIG = "$HKAUDIO_CONFIG"
HKAUDIO_DEVICENAME = "$HKAUDIO_DEVICENAME"
EndOfHere

mkdir /tmp/home
export HOME=/tmp/home
cat >$HOME/.bashrc <<EndOfHere
alias ll='ls -l'
EndOfHere

if [[ ! -e /yocto/sources/meta-hkaudio/recipes/dropbear/hostkeys/${HKAUDIO_CONFIG}_rsa_host_key ]]; then
  dropbearkey -t rsa -s 2048 -f /yocto/sources/meta-hkaudio/recipes/dropbear/hostkeys/${HKAUDIO_CONFIG}_rsa_host_key
fi

bash
