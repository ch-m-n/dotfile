#!/usr/bin/env bash

CONFIG_FILES="$HOME/.config/waybar/config $HOME/.config/waybar/style.css"

trap "killall waybar" EXIT

while true; do
    killall waybar 2> /dev/null
    GDK_BACKEND=wayland waybar &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
