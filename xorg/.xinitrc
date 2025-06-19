# Set up monitors
xrandr --output USB-C-0 --mode 1920x1080 --rotate right
xrandr --output HDMI-0 --primary --scale 0.75

# Keyboard layouts
setxkbmap -layout us,ru -option grp:win_space_toggle

# Launch i3 window manager
exec i3
