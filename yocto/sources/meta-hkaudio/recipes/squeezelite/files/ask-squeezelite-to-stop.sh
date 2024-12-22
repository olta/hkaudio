#! /bin/bash

id=$(cat /sys/class/net/wlan0/address)
url=http://192.168.1.1:9000/jsonrpc.js

echo "releasing squeezelite playback (for player $id) via server ..."
mode=$(curl -s -S -X POST -d '{"id":1,"method":"slim.request","params":["'$id'",["status"]]}' $url \
      | jq '.result.mode' \
      | tr -d '"')
if [[ $mode == play ]]; then
    curl -X POST -s -S -d '{"id":0,"params":["'$id'",["pause"]],"method":"slim.request"}' $url
fi
