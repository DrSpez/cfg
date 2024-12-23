#!/bin/sh
echo "Changing wallpaper to" $@
hyprctl hyprpaper preload "$@"
hyprctl hyprpaper wallpaper ",$@"

