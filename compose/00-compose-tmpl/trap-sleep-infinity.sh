#!/bin/bash
set -e

#if [ "$1" = 'start' ]; then
if true; then
    ##################### handle SIGTERM #####################
    function _term() {
        printf "%s\n" "Caught terminate signal!"

        # kill -SIGTERM $child 2>/dev/null
        exit 0
    }

    trap _term SIGHUP SIGINT SIGTERM SIGQUIT

    sleep infinity &
    child=$!
    wait "$child"
fi

exec "$@"

