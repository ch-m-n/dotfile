#!/bin/bash

# Check if ibus is running
if ! pgrep -x ibus-daemon > /dev/null; then
    notify-send "IBus" "IBus daemon is not running" -u normal
    exit 1
fi

# Get list of all ibus engines
ENGINES=($(ibus list-engine | grep -v "^$" | awk '{print $1}'))

# Check if there are engines available
if [ ${#ENGINES[@]} -eq 0 ]; then
    notify-send "IBus" "No input engines configured" -u normal
    exit 1
fi

# Get current engine
CURRENT=$(ibus engine 2>&1)

# If no engine is set, set the first one
if [[ "$CURRENT" == *"No engine is set"* ]] || [ -z "$CURRENT" ]; then
    ibus engine "${ENGINES[0]}"
    pkill -RTMIN+1 waybar
exit 0
fi

# Find current index
CURRENT_INDEX=-1
for i in "${!ENGINES[@]}"; do
    if [ "${ENGINES[$i]}" = "$CURRENT" ]; then
        CURRENT_INDEX=$i
        break
    fi
done

# Calculate next index (cycle through)
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#ENGINES[@]} ))

# Switch to next engine
ibus engine "${ENGINES[$NEXT_INDEX]}"

# Send signal to waybar to update
pkill -RTMIN+1 waybar

