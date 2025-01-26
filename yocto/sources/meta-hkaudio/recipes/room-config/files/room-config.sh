#! /bin/bash

serial=$(cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2)
ln -sfn $serial.config /etc/room-config/current

. /etc/room-config/current

hostnamectl hostname ${HKAUDIO_HOSTNAME}

ln -sfn asound_$HKAUDIO_ALSA_CONFIG.conf /etc/asound.conf
ln -sfn ${HKAUDIO_HOSTNAME}_rsa_host_key /etc/dropbear/dropbear_rsa_host_key
ln -sfn wpa_supplicant_$HKAUDIO_WIFI_AREA.conf /etc/wpa_supplicant.conf
