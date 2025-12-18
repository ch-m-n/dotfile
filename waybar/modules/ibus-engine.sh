#!/bin/bash

# Check if ibus is running
if ! pgrep -x ibus-daemon > /dev/null; then
    echo "{\"text\":\"󰌌 --\", \"tooltip\":\"IBus not running\nRight-click to configure\"}"
    exit 0
fi

# Get current ibus engine
ENGINE=$(ibus engine 2>&1)

# Check if no engine is set
if [[ "$ENGINE" == *"No engine is set"* ]] || [ -z "$ENGINE" ]; then
    echo "{\"text\":\"󰌌 --\", \"tooltip\":\"No IBus engine set\nRight-click to configure\"}"
    exit 0
fi

# Map engine names to display text with icons
case "$ENGINE" in
    "xkb:us::eng")
        TEXT="󰌌 EN"
        ;;
    "xkb:de::ger")
        TEXT="󰌌 DE"
        ;;
    "BambooUs")
        TEXT="󰌌 VN"
        ;;
    "Bamboo")
        TEXT="󰌌 VN"
        ;;
    "Unikey")
        TEXT="󰌌 VN"
        ;;
    "anthy")
        TEXT="󰌌 JP"
        ;;
    "libpinyin")
        TEXT="󰌌 CN"
        ;;
    "hangul")
        TEXT="󰌌 KR"
        ;;
    *)
        # Extract language code from engine name
        LANG=$(echo "$ENGINE" | grep -oP '(?<=:)[a-z]{2}(?=:)' | head -1)
        if [ -n "$LANG" ]; then
            TEXT="󰌌 ${LANG^^}"
        else
            # Fallback to first 2 chars
            TEXT="󰌌 ${ENGINE:0:2}"
        fi
        ;;
esac

# Output JSON for waybar
echo "{\"text\":\"$TEXT\", \"tooltip\":\"IBus: $ENGINE\nClick to switch • Right-click for settings\"}"

