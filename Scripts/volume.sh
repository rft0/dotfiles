#!/bin/bash

vol=$(amixer get Master | grep -oP '\d+(?=%)' | head -n 1)
if [[ "$1" == "mute" ]]; then
    amixer set Master toggle > /dev/null
    mute_status=$(amixer get Master | grep -o "\[on\]\|\[off\]" | head -n 1)

    if [[ "$mute_status" == "[off]" ]]; then
        dunstify -a "volchange" -u low -r 9991 -h int:value:0 -i "volume" "Muted" -t 1000
	exit 0
    fi

    dunstify -a "volchange" -u low -r 9991 -h int:value:"$vol" -i "volume" "Volume: $vol%" -t 1000
    exit 0
fi


STEP=$(echo "$2" | bc -l)

[[ "$1" == "inc" ]] && (( vol += STEP ))
[[ "$1" == "dec" ]] && (( vol -= STEP ))

LIMIT=true
if [[ "$LIMIT" == true ]] ; then
    # If vol is greater than 100%, set it to 100%
    [[ "$vol" -gt 100 ]] && vol=100

    # If vol is less than 0%, set it to 0%
    [[ "$vol" -lt 0 ]] && vol=0
fi

# Set the volume using amixer (ALSA)
amixer set Master "$vol%" > /dev/null

# Get the updated volume for display
vol=$(amixer get Master | grep -oP '\d+(?=%)' | head -n 1)

# Display the volume change with dunstify
dunstify -a "volchange" -u low -r 9991 -h int:value:"$vol" -i "volume" "Volume: $vol%" -t 1000
