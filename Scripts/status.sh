#!/bin/bash

i3status | while :
do
    read line
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F' ' '{print $5}' | awk -F'%' '{print $1}')
    echo "Vol: $vol | $line" || exit 1
done
