#!/bin/bash

# Check if Waybar is running
if pgrep -x "waybar" > /dev/null; then
    # Kill Waybar to hide it
    pkill waybar
else
    # Restart Waybar
    waybar &
fi
