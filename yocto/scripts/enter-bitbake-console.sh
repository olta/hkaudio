#!/bin/bash

cd /yocto
. sources/poky/oe-init-build-env

mkdir /tmp/home
export HOME=/tmp/home
cat >$HOME/.bashrc <<EndOfHere
alias ll='ls -l'
EndOfHere

bash
