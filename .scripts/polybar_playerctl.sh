#!/bin/zsh

# title=$(playerctl metadata | grep "title" | awk -F "  " '{print $(NF-0)}')
TITLE=$(playerctl metadata title -s | head -c 36)
ARTIST=$(playerctl metadata artist -s)

if [[ $? -eq 0 ]]; then
	PLAYER_DETAILS=$m echo "$ARTIST - $TITLE"
else
	PLAYER_DETAILS=$m echo ""
fi
