#!/bin/bash

# Simple weather module for Waybar
# You can customize this to use your preferred weather API

# Check if curl is available
if ! command -v curl &> /dev/null; then
    echo '{"text":"", "tooltip":"Install curl for weather"}'
    exit 0
fi

# Try to get weather from wttr.in (no API key needed)
WEATHER_DATA=$(curl -s "wttr.in/?format=%c+%t" 2>/dev/null | head -n 1)

# Check if we got data
if [ -z "$WEATHER_DATA" ] || [ "$WEATHER_DATA" == "Unknown location" ]; then
    echo '{"text":"󰖐", "tooltip":"Weather unavailable"}'
else
    # Clean up the data
    WEATHER_CLEAN=$(echo "$WEATHER_DATA" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    
    # Output JSON for Waybar
    echo "{\"text\":\"$WEATHER_CLEAN\", \"tooltip\":\"Click to update weather\"}"
fi
