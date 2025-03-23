#!/bin/bash

STATUS_FUL="✅ FUL"
STATUS_CHR="⚡ CHR"
STATUS_LOW="❌ LOW"
STATUS_BAT="🔋 BAT"

COLOR_GREEN="#00FF00"
COLOR_YELLOW="#FFFF00"
COLOR_RED="#FF0000"

NOTIFY_FILE="/tmp/low_battery_notify_sent"

BATTERY_INFO=$(acpi -b)

STATE=$(echo "$BATTERY_INFO" | awk -F'[ ,]' '{print $3}')

PERCENTAGE=$(echo "$BATTERY_INFO" | grep -E -o '[0-9]{1,3}%')

if [[ "$STATE" == "Discharging" ]]; then
	if [[ ${PERCENTAGE%?} -le 10 ]]; then
        echo "$STATUS_LOW $PERCENTAGE" && echo ""
        echo "$COLOR_RED"

        if [[ ! -f "$NOTIFY_FILE" ]]; then
            notify-send --urgency=critical "Low Battery" "Plug in your PC."
            touch "$NOTIFY_FILE"
        fi
    else
        echo "$STATUS_BAT $PERCENTAGE" && echo ""
    fi
else
	if [[ ${PERCENTAGE%?} -eq 100 ]]; then
        echo "$STATUS_FUL $PERCENTAGE" && echo ""
        echo "$COLOR_GREEN"
    else
        echo "$STATUS_CHR $PERCENTAGE" && echo ""
        echo "$COLOR_YELLOW"

        if [[ ${PERCENTAGE%?} -gt 10 ]]; then
            rm -f "$NOTIFY_FILE"
        fi
    fi
fi

exit 0
