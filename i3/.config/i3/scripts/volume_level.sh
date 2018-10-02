#!/bin/dash
# Pulse Audio controls

if [ "$( pacmd dump | awk '$1 == "set-sink-mute" {m[$2] = $3} $1 == "set-default-sink" {s = $2} END {print m[s]}')" = 'yes' ]
then
	pactl set-sink-mute 0 toggle
fi

case "$1" in
	up)
		pactl set-sink-volume 0 +5% #increase sound volume
		;;
	down)
		pactl set-sink-volume 0 -5% #decrease sound volume
		;;
esac

