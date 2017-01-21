#!/bin/bash

files=($HOME/media/pictures/Wallpapers/*.jpg)
wallpaper=`printf "%s\n" "${files[RANDOM % ${#files[@]}]}"`
feh --bg-fill --no-xinerama "$wallpaper"
echo "Changed wallpaper..."
