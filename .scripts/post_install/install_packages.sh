#!/bin/bash
#

sudo pacman -Syy $(
filename='./packages.txt'
while read line; do
	echo "$line"
done < $filename
)

