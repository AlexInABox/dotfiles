#!/bin/bash

pid=$(pgrep -a thunderbird | grep headless | awk '{print $1}')

if [ -n "$pid" ]; then
    kill "$pid"
    echo "Killed Thunderbird (headless) with PID $pid"
fi

thunderbird &
echo "Started Thunderbird (normal mode)"
