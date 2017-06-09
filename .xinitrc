#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

#merge in defaults and keymaps

xrdb -load $HOME/.Xresources

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

#start programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?.sh;
		do [ -x "$f" ] && . "$f"
	done
	unset f
fi

xset -dpms
xset s off -dpms
xset -b

sh /home/chris/.screenlayout/default.sh
udiskie --use-udisks2 &

pulseaudio --start
mpd &
urxvtd &

#exec awesome
#exec bspwm
exec openbox-session
