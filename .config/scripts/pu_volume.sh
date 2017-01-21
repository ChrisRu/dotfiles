#!/bin/bash
current_vol=$(amixer -c 0 get 'Master' |tail -1| sed 's/.*\[\([0-9][0-9]\%\)\].*/\1/g'| sed 's/%//g')

new_vol=$(zenity --scale --value=$current_vol --title "Adjust volume" --text "Adjust volume")
amixer -q -c 0 sset 'Master' $new_vol%

if [[ $new_vol != "$current_vol" && $new_vol != "" ]]; then
	notify-send -t 150 "Volume set" "$new_vol%"
fi
