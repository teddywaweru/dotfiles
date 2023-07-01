#!/bin/bash

extern=HDMI-1
primary=eDP-1
if xrandr | grep "$extern"; then
	xrandr --output "$extern" --auto --mode 1920x1080 --above "$primary"
	#nitrogen --restore
fi
feh --bg-fill ~/Pictures/Desktop/black-panther-2.jpg ~/Pictures/Desktop/death-stranding-cliff-mads-mikkelsen-uhdpaper.com-4K-26.jpg  &
