#!/bin/bash

extern=HDMI-1
primary=eDP-1
if xrandr | grep "$extern"; then
	line=$( xrandr | grep "$extern" -n | cut -d : -f 1 )
	resolution_line=$(($line+1))
	resolution=$(xrandr| sed -n "$resolution_line p" | awk -F " " '{print $1}' )
	xrandr --output "$extern" --auto --mode "$resolution" --above "$primary" --refresh 120
	# xrandr --output "$extern" --auto --mode 1600x900 --above "$primary"
	nitrogen --restore
fi
