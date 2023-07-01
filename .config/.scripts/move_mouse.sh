#!/bin/sh
set -e

output=$(xdotool getactivewindow getwindowgeometry --shell)

# Option 1: Less Readable
props=(window width height)
echo $output  
props=( $(echo $output | awk '{print $1; print $4; print $5;}'| cut -d "=" -f 2 ) ) 
move_x=$((${props[1]} / 2))
move_y=$((${props[2]} / 2))
echo "$props[3]"
xdotool mousemove --window $props $move_x $move_y

# Option 2: Alternatively ...
# read -r window width height <<<  $( echo $(echo $output | awk '{print $1; print $4; print $5;}' | cut -d "=" -f 2) )  
# move_y=$(($height / 2))
# move_x=$(($width / 2))
# xdotool mousemove --window $window $move_x $move_y
