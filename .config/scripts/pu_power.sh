#!/bin/bash

env DISPLAY=:0.0 zenity --question --title="Shutdown" --text="Are you sure you want to shutdown?" --ok-label="Shutdown" --default-cancel --window-icon="warning" --icon-name="warning"
rc=$?

if [ "${rc}" == "0" ]; then
	echo "Powering off..."
	for window in $(bspc query -W); do
		bspc window $window_id -c
	done
	systemctl poweroff
else
	echo "Poweroff terminated"
fi
