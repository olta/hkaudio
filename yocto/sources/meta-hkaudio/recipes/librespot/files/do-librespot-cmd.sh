#! /bin/bash -e

cmd=$1

if [[ -z $cmd ]]; then
    echo >&2 "$0: needs cmd, got: $@"
    exit 5
fi

echo "$0: $@"

mkdir -p /run/librespot

case "$cmd" in

    play-pause)
        touch /run/librespot/toggle-playback
        ;;

    volume-up)
        # not implemented yet
        # touch /run/librespot/volume-up
        ;;

    volume-down)
        # not implemented yet
        # touch /run/librespot/volume-down
        ;;

esac
