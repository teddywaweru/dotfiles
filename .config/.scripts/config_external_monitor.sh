#!/bin/bash

extern=HDMI-1
primary=eDP-1
if xrandr | grep "$extern"; then
	xrandr --output "$extern" --auto --mode 1920x1080 --above "$primary"
	xrandr --output "$extern" --auto --mode 1600x900 --above "$primary"
	nitrogen --restore
fi
