#!/bin/bash

COLOR_ORANGE="#FFBB00"

VOLUME_INFO=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

PERCENTAGE="$(echo "$VOLUME_INFO" | awk '{print $2 * 100}')%"

MUTED=$(echo "$VOLUME_INFO" | awk '{print $3}')

if [[ "$MUTED" == "[MUTED]" ]]; then
	echo "🎧 $PERCENTAGE (muted)" && echo ""
    echo "$COLOR_ORANGE"
else
    echo "🎧 $PERCENTAGE" && echo ""	
fi

exit 0