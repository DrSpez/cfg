#!/bin/bash

# Kill any existing Polybar instances
# killall -q polybar

# Launch Polybar on each connected monitor
# polybar


# for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar bar1 &
# done


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar
