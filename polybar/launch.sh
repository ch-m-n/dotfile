#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

#polybar example  >>/tmp/polybar1.log 2>&1 &
#polybar top -r >>/tmp/polybar1.log 2>&1 & disown

#echo "Bars launched..."
