song=$(spt playback)
if [[ "$PLAYER_EVENT" != "play" ]]; then
	exit 0
	
fi
dunstify -a "spotify" "$song"
