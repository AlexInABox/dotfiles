#!/bin/bash

while true; do
    if ! pgrep -x thunderbird > /dev/null; then
        nohup thunderbird --headless >/dev/null 2>&1 &
        echo "Started Thunderbird (headless)"
    fi
    sleep 10
done
