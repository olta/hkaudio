#! /bin/bash -e

cmd=$1

if [[ -z $cmd ]]; then
    echo >&2 "$0: needs cmd, got: $@"
    exit 5
fi

if [[ -e /run/res-man/active.squeezelite ]]; then
    do-squeeze-cmd.sh $cmd
fi
