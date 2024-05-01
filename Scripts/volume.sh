#!/bin/bash

# Get current volume with pactl (Alternative = pactl get-sink-volume @DEFAULT_SINK@ | grep -Po "[0-9]{1,2}(?=%)")
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F' ' '{print $5}' | awk -F'%' '{print $1}')

STEP=$(echo "$2" | bc -l)

[[ "$1" == "inc" ]] && (( vol += STEP ))
[[ "$1" == "dec" ]] && (( vol -= STEP ))

LIMIT=true
if [[ "$LIMIT" == true ]] ; then
    # If vol is greater than 1.0 set it to 1.0
    [[ $(echo "$vol > 100.0" | bc -l) -eq 1 ]] && vol=100.0

    # if vol is lesser than 0.0 set it to 0.0
    [[ $(echo "$vol < 0.0" | bc -l) -eq 1 ]] && vol=0.0
fi

pactl set-sink-volume @DEFAULT_SINK@ "$vol"%

pactl get-sink-volume @DEFAULT_SINK@ | awk -F' ' '{print $5}' | awk -F'%' '{print $1}'
dunstify -a "volchange" -u low -r 9991 -h int:value:"$vol" -i "volume" "Volume: $vol%" -t 1000
