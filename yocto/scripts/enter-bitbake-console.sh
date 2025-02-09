#!/bin/bash

cd /yocto
rm -f build/conf/local.conf
. sources/poky/oe-init-build-env

cat >>conf/local.conf <<EndOfHere

# device configuration:
DISTRO = "hkaudio"
MACHINE = "raspberrypi0-2w-64"
SERIAL_CONSOLES = "115200;ttyAMA0"
SERIAL_CONSOLES_CHECK = "115200;ttyAMA0"
EndOfHere

mkdir /tmp/home
export HOME=/tmp/home
cat >$HOME/.bashrc <<EndOfHere
alias ll='ls -l'
export EDITOR=vim
EndOfHere

git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"

bash
