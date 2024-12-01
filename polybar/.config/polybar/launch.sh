#!/bin/zsh

# Terminate already running polybar instances
killall -q polybar

# Launch polybar on each connected monitor
# polybar
# for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar bar1 &
# done

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null 2>&1; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar --reload
