#! /bin/bash

cmd=$1
target=$2

if [[ -z $cmd || -z $target ]]; then
    echo >&2 "$0: needs cmd and target, got: $@"
    exit 5
fi

mkdir -p /run/res-man
cd /run/res-man

shopt -s nullglob

case "$cmd" in
    switch-to)
        echo "$0: $target tries to acquire playback ..."
        for current_file in active.*; do
            current=${current_file:7}
            echo "$0: need to ask $current to stop playback ..."
            touch stop.${current}
            ask-$current-to-stop.sh
            for i in {1..50}; do
                if [[ ! -e $current_file ]]; then
                    break;
                fi
                sleep 0.1
            done
            if [[ -e $current_file ]]; then
                echo "$0: $current failed to release playback after 5 seconds - forcing it ..."
                rm -f $current_file
                systemctl restart $current
            fi
        done
        touch active.${target}
        echo "$0: $target successfully acquired playback"
        ;;
    mark-as-stopped)
        echo "$0: $target has stopped playback"
        rm -f stop.$target active.$target
        ;;
esac
