#!/bin/bash

pactl set-sink-mute @DEFAULT_SINK@ toggle

mute_status=$(pactl list sinks | grep "Mute: " | cut -d ' ' -f2)

if [ "$mute_status" = "yes" ]; then
    dunstify -a "volmute" -r 9991 -u low -i "audio-muted" "Volume Muted" -t 1000
else
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F' ' '{print $5}' | awk -F'%' '{print $1}')
    dunstify -a "volmute" -r 9991 -u low -i "audio-unmuted" -h int:value:"$volume" "Volume: $volume%" -t 1000
fi
