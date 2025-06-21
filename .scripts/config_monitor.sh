#!/bin/zsh

set -e

#TODO: config checks for "connected" label for the screens

HDMI=HDMI-1
DP_1=DP-1
DP_2=DP-2

primary=eDP-1

set_available_displays() {

	external_monitors=()

	if ! xrandr | grep -q "$HDMI disconnected"; then
		external_monitors+=$HDMI
	fi
	if ! xrandr | grep -q "$DP_1 disconnected"; then
		external_monitors+=$DP_1
	fi
	if ! xrandr | grep -q "$DP_2 disconnected"; then
		external_monitors+=$DP_2 
	fi

	if [ ${#external_monitors[@]} -eq 0 ]; then
		echo "No external monitors detected"
		line=$(xrandr | grep -q "$primary" -n | cut -d : -f 1)
		prim_res_line=$(($line + 1))
		prim_res=$(xrandr | sed -n "$prim_res_line p" | awk -F " " '{print $1}')
		xrandr --auto
		return
	else
		if [ ${#external_monitors[@]} -eq 1 ]; then
			for monitor in ${external_monitors}; do
				set_scaling $monitor "--above"
			done
		else
			if [ ${#external_monitors[@]} -eq 2 ]; then
				for monitor in ${external_monitors}; do
					set_scaling $monitor "--above"
				done
			else
				if [ ${#external_monitors[@]} -eq 3 ]; then
					for monitor in ${external_monitors}; do
						set_scaling $monitor "--above"
					done
				else
					echo "Number of External Monitors Greater than 3"
				fi
			fi
		fi
	fi
}

set_scaling() {
	extern=$1   # External screen
	position=$2 # Desired position of screen

	line=$(xrandr | grep "$extern" -n | cut -d : -f 1)
	extern_res_line=$(($line + 1))                                               # Grep line containing external screen resolution
	extern_res=$(xrandr | sed -n "$extern_res_line p" | awk -F " " '{print $1}') # External Screen Resolution

	line=$(xrandr | grep "$primary" -n | cut -d : -f 1)
	prim_res_line=$(($line + 1))
	prim_res=$(xrandr | sed -n "$prim_res_line p" | awk -F " " '{print $1}')

	if [[ $prim_res == $extern_res && "$prim_res" == "1920x1080" ]]; then
		xrandr --output "$extern" --mode $extern_res "${position}" "$primary"

	else
		xrandr --output "$primary" --mode 1920x1080

		if [[ $extern_res == "1920x1080" ]]; then
			xrandr --output "$extern" --mode $extern_res --scale 1x0.999 --above eDP-1
		else
			# xrandr --output "$HDMI"  --mode "1920x1080" --above "$primary"
			xrandr --output "$extern" --mode "1920x1200" "${position}" "$primary"
			# xrandr --output "$HDMI"  --mode $extern_res --above "$primary"
			echo "$prim_res"
		fi

		xrandr --output eDP-1 --mode $prim_res --refresh 60
	fi

}

set_available_displays

# if ! xrandr | grep -q "$HDMI disconnected"; then
# 	line=$(xrandr | grep -q "$HDMI" -n | cut -d : -f 1)
# 	HDMI_resolution_line=$(($line + 1))
# 	HDMI_resolution=$(xrandr | sed -n "$HDMI_resolution_line p" | awk -F " " '{print $1}')
#
# 	line=$(xrandr | grep -q "$primary" -n | cut -d : -f 1)
# 	prim_resolution_line=$(($line + 1))
# 	prim_resolution=$(xrandr | sed -n "$prim_resolution_line p" | awk -F " " '{print $1}')
#
# 	if [[ $prim_resolution == $HDMI_resolution && "$prim_resolution" == "1920x1080" ]]; then
# 		xrandr --output "$HDMI" --mode $HDMI_resolution --above "$primary"
#
# 	else
# 		xrandr --output "$primary" --mode 1920x1080
#
# 		if [[ $HDMI_resolution == "1920x1080" ]]; then
# 			xrandr --output "$HDMI" --mode $HDMI_resolution --scale 1x0.999 --above eDP-1
# 		else
# 			# xrandr --output "$HDMI"  --mode "1920x1080" --above "$primary"
# 			xrandr --output "$HDMI" --mode "1920x1200" --above "$primary"
# 			# xrandr --output "$HDMI"  --mode $HDMI_resolution --above "$primary"
# 			echo "$prim_resolution"
# 		fi
#
# 		xrandr --output eDP-1 --mode $prim_resolution --refresh 60
# 	fi
#
# else
# 	echo "HDMI disconnected"
# 	line=$(xrandr | grep -q "$primary" -n | cut -d : -f 1)
# 	prim_resolution_line=$(($line + 1))
# 	prim_resolution=$(xrandr | sed -n "$prim_resolution_line p" | awk -F " " '{print $1}')
# 	xrandr --auto
#
# fi
