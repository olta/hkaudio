#!/bin/bash

config=$1

if [[ ! $config ]]; then
    echo >&2 "*** usage: $0 <config>"
    exit 5
fi

if [[ ! -e configs/$config.config ]]; then
    echo >&2 "*** given config '$config' doesn't exist in configs folder!"
    exit 5
fi

docker build --pull -t rpi-build-environment .

docker run --rm -ti --user=1000:1000 --env=HKAUDIO_CONFIG=$config --env-file=configs/$config.config -v=./yocto:/yocto rpi-build-environment /yocto/scripts/enter-bitbake-console.sh
