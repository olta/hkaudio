#!/bin/bash

cd /yocto
rm -f build/conf/local.conf
. sources/poky/oe-init-build-env

cat >>conf/local.conf <<EndOfHere

# device configuration:
DISTRO = "hkaudio"
MACHINE = "$MACHINE"
hostname:pn-base-files = "$HKAUDIO_HOSTNAME"
HKAUDIO_ALSA_CONFIG = "$HKAUDIO_ALSA_CONFIG"
HKAUDIO_CONFIG = "$HKAUDIO_CONFIG"
HKAUDIO_DEVICENAME = "$HKAUDIO_DEVICENAME"
HKAUDIO_LIRC = "$HKAUDIO_LIRC"
HKAUDIO_LMS_SERVER = "$HKAUDIO_LMS_SERVER"
EndOfHere

mkdir /tmp/home
export HOME=/tmp/home
cat >$HOME/.bashrc <<EndOfHere
alias ll='ls -l'
export EDITOR=vim
EndOfHere

git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"

if [[ ! -e /yocto/sources/meta-hkaudio/recipes/dropbear/hostkeys/${HKAUDIO_CONFIG}_rsa_host_key ]]; then
  dropbearkey -t rsa -s 2048 -f /yocto/sources/meta-hkaudio/recipes/dropbear/hostkeys/${HKAUDIO_CONFIG}_rsa_host_key
fi

bash
