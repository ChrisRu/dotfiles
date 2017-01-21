#!/bin/bash

if [ "$1" == "-l" ]; then
	amixer -q sset Master 2%-
    message="Volume Lowered"
elif [ "$1" == "-r" ]; then
	amixer -q sset Master 2%+
    message="Volume Raised"
elif [ "$1" == "-m" ]; then
	amixer -q sset Master +1 toggle
	mute=$(awk -F"[][]" '/dB/ { print $6 }' <(amixer sget Master))
    readonly volume=""
    if [ "$mute" == "off" ]; then
		message="Volume Muted"
	else
		message="Volume Unmuted"
	fi
else
	printf "Use a parameter \n-l    lower volume \n-r    raise volume \n-m    toggle mute\n"
    exit
fi

volume=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
notify-send --hint int:transient:1 -t 150 "$message" "$volume"
