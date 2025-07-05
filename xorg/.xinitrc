# Monitors
xrandr --output USB-C-0 --mode 1920x1080 --rotate right
xrandr --output HDMI-0 --primary --scale 0.75

# Keyboard
setxkbmap -layout us,ru -option grp:win_space_toggle
xset r rate 220 50

# Launch i3wm
exec i3
