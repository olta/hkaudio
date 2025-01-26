#!/bin/bash

docker build --pull -t rpi-build-environment .

docker run  --rm -ti --user=$(id -u):$(id -g) \
            --network host \
            --env=GIT_USER_EMAIL="$(git config user.email)" \
            --env=GIT_USER_NAME="$(git config user.name)" \
            -v=./yocto:/yocto \
            rpi-build-environment /yocto/scripts/enter-bitbake-console.sh
