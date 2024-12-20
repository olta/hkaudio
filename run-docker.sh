#!/bin/bash

docker run --rm -ti --user=1000:1000 -v=./yocto:/yocto rpi-build-environment /yocto/scripts/enter-bitbake-console.sh
