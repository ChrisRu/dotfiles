#!/bin/sh
xrandr \
	--output DisplayPort-0 --off \
	--output DVI-I-1 --off \
	--output DVI-D-0 --mode 1920x1080 --pos 2560x0 --rotate normal \
	--output HDMI-A-0 --primary --mode 2560x1080 --pos 0x0 --rotate normal
