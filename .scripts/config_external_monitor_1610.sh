#!/bin/sh
#
xrandr --output eDP-1 --mode 1920x1080

xrandr --output HDMI-1 --mode 1920x1080 --scale 1x0.999 --above eDP-1 --refresh 60

xrandr --output eDP-1 --mode 1920x1200 --refresh 60
