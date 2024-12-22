#! /bin/bash

if [[ $PLAYER_EVENT = sink ]]; then
    case "$SINK_STATUS" in
        running)
            res-man.sh switch-to librespot
            ;;
        closed)
            res-man.sh mark-as-stopped librespot
            ;;
        *)
            echo "sink-status: $SINK_STATUS"
            ;;
    esac
fi
