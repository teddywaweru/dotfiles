#!/bin/sh

set -e

extern=HDMI-1
primary=eDP-1
if ! xrandr | grep "$extern disconnected"; then
	echo "HDMI connected"
	line=$( xrandr | grep "$extern" -n | cut -d : -f 1 )
	extern_resolution_line=$(($line+1))
	extern_resolution=$(xrandr| sed -n "$extern_resolution_line p" | awk -F " " '{print $1}' )

	line=$( xrandr | grep "$primary" -n | cut -d : -f 1 )
	prim_resolution_line=$(($line+1))
	prim_resolution=$(xrandr| sed -n "$prim_resolution_line p" | awk -F " " '{print $1}' )

	if [[  $prim_resolution == $extern_resolution && "$prim_resolution" == "1920x1080"  ]]; then
		xrandr --output "$extern"  --mode $extern_resolution --above "$primary" 

	else
		xrandr --output "$primary" --mode 1920x1080

		if [ $extern_resolution == "1920x1080" ]; then
			xrandr --output HDMI-1 --mode $extern_resolution --scale 1x0.999 --above eDP-1 
		else 
			# xrandr --output "$extern"  --mode "1920x1080" --above "$primary" 
			xrandr --output "$extern"  --mode "1920x1200" --above "$primary" 
			# xrandr --output "$extern"  --mode $extern_resolution --above "$primary" 
			echo "$prim_resolution"
		fi

		xrandr --output eDP-1 --mode $prim_resolution --refresh 60
	fi

fi
