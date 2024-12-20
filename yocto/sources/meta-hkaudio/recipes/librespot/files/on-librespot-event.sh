#! /bin/bash

/usr/bin/logger -t $0 "$PLAYER_EVENT"

if [[ $PLAYER_EVENT = sink ]]; then
    case "$SINK_STATUS" in
        running)
            /usr/bin/logger -t $0 "wait some time to be able to open sink..."
            sleep 1
            ;;
        closed)
            /usr/bin/logger -t $0 "sink has been closed"
            ;;
        *)
            /usr/bin/logger -t $0 "sink-status: $SINK_STATUS"
            ;;
    esac
fi

exit 0
