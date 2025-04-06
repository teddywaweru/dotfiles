#!/bin/zsh

set -e

title=$( playerctl metadata |grep "title" | awk -F "  " '{print $(NF-0)}' )


echo "${title}"
