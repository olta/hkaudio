#! /bin/bash -e

cmd=$1

if [[ -z $cmd ]]; then
    echo >&2 "$0: needs cmd, got: $@"
    exit 5
fi

echo "$0: $@"

mkdir -p /run/go-librespot

baseUrl=http://localhost:3678/player

case "$cmd" in

    pause-if-playing)
        curl -4 -s -S -X POST ${baseUrl}/pause >/dev/null
        ;;

    play-pause)
        curl -4 -s -S -X POST ${baseUrl}/playpause >/dev/null
        ;;

    volume-up)
        curl -4 -s -S -X POST -d '{"volume":5,"relative":true}' ${baseUrl}/volume >/dev/null
        ;;

    volume-down)
        curl -4 -s -S -X POST -d '{"volume":-5,"relative":true}' ${baseUrl}/volume >/dev/null
        ;;

esac
