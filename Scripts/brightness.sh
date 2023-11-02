#!/bin/bash

OUTPUT="eDP-1"
STEP=$(echo "$2 * 0.01" | bc -l)

buffer=$( xrandr --verbose --current | grep ^"$OUTPUT" -A5 | tail -n1 )
brightness=$(echo "$buffer" | awk -F ": " '{print $2}')

[[ "$1" == "inc" ]] && brightness=$(bc -l <<< "$brightness + $STEP")
[[ "$1" == "dec" ]] && brightness=$(bc -l <<< "$brightness - $STEP")

LIMIT=true
if [[ "$LIMIT" == true ]] ; then
    # If brightness is greater than 1.0 set it to 1.0
    [[ $(echo "$brightness > 1.0" | bc -l) -eq 1 ]] && brightness=1.0

    # if brightness is lesser than 0.0 set it to 0.0
    [[ $(echo "$brightness < 0.0" | bc -l) -eq 1 ]] && brightness=0.0
fi

xrandr --output "$OUTPUT" --brightness "$brightness"
