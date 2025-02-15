#! /bin/bash

if [[ ! -e /etc/go-librespot/config.yml ]]; then
    . /etc/room-config/current
    sed -e "s/@@HKAUDIO_DEVICENAME@@/${HKAUDIO_DEVICENAME}/g" /etc/go-librespot/config.yml.in \
        >/etc/go-librespot/config.yml
fi
