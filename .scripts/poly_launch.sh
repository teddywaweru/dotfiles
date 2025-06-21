#!/bin/zsh

set -e

if  pgrep -x polybar > /dev/null 2>&1; then
	killall -q polybar
fi

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload bar2 &
	done
else
	polybar --reload bar2 &
fi
