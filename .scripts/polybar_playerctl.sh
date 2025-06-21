#!/bin/zsh

# title=$(playerctl metadata | grep "title" | awk -F "  " '{print $(NF-0)}')
players=$(playerctl metadata -l)
while IFS= read -r line; do
	if [ "$line" = "spotify_player" ]; then
	player="spotify_player"
else
	player=""
	fi
done <<<"$players"

TITLE=$(playerctl metadata --player="$player" title -s | head -c 36)
ARTIST=$(playerctl metadata --player="$player" artist -s)

if [[ $? -eq 0 ]]; then
	PLAYER_DETAILS=$m echo "$ARTIST - $TITLE"
else
	PLAYER_DETAILS=$m echo ""
fi
