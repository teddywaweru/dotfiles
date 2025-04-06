#!/bin/zsh

set -e

killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bar2 &
  done
else
  polybar --reload bar2 &
fi
