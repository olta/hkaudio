#! /bin/bash -e

cmd=$1

if [[ -z $cmd ]]; then
    echo >&2 "$0: needs cmd, got: $@"
    exit 5
fi

if [[ -e /run/res-man/active.squeezelite ]]; then
    do-squeeze-cmd.sh $cmd
elif [[ -e /run/res-man/active.go-librespot ]]; then
    do-go-librespot-cmd.sh $cmd
elif [[ -e /run/res-man/active.librespot ]]; then
    do-librespot-cmd.sh $cmd
fi
