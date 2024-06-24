#!/bin/sh

set -e

enabled=1
disabled=0

touchpad_id=$(xinput list | grep "Touchpad" | awk '{print $6}' |cut -d "=" -f 2)

enable_tapping_button_id=$(xinput list-props $touchpad_id | grep "Tapping Enabled" | grep -v "Default" | awk '{print $4}' | grep -o '[0-9]\+' )
enable_natural_scrolling_id=$(xinput list-props $touchpad_id | grep "Natural Scrolling Enabled" | grep -v "Default" | awk '{print $5}' | grep -o '[0-9]\+' )

xinput set-prop $touchpad_id $enable_tapping_button_id $enabled
xinput set-prop $touchpad_id $enable_natural_scrolling_id $enabled
