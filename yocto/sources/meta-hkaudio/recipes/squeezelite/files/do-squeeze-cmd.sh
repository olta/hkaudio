#! /bin/bash -e

cmd=$1

if [[ -z $cmd ]]; then
    echo >&2 "$0: needs cmd, got: $@"
    exit 5
fi

. /etc/room-config/current

id=$(cat /sys/class/net/wlan0/address)
url=http://${HKAUDIO_LMS_SERVER}/jsonrpc.js

case "$cmd" in

    pause-if-playing)
        mode=$(curl -s -S -X POST -d '{"id":1,"method":"slim.request","params":["'$id'",["status"]]}' $url \
              | jq '.result.mode' \
              | tr -d '"')
        if [[ $mode == play ]]; then
            echo "releasing squeeze playback via server ..."
            curl -X POST -s -S -d '{"id":0,"params":["'$id'",["pause"]],"method":"slim.request"}' $url >/dev/null
        fi
        ;;

    play-pause)
        echo "toggling squeeze play/pause via server ..."
        curl -X POST -s -S -d '{"id":0,"params":["'$id'",["pause"]],"method":"slim.request"}' $url >/dev/null
        ;;

    play-preset)
        preset=$2
        echo "asking squeeze server to play favorite $preset ..."
        curl -X POST -s -S -d '{"id":0,"params":["'$id'",["favorites", "playlist", "play", "item_id:'$preset'"]],"method":"slim.request"}' $url >/dev/null
        ;;

    volume-up)
        curl -X POST -s -S -d '{"id":0,"params":["'$id'",["mixer", "volume", "+5", "item_id:10"]],"method":"slim.request"}' $url >/dev/null
        ;;

    volume-down)
        curl -X POST -s -S -d '{"id":0,"params":["'$id'",["mixer", "volume", "-5", "item_id:10"]],"method":"slim.request"}' $url >/dev/null
        ;;

esac
