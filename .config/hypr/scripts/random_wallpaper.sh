#!/usr/bin/env bash

for i in {1..30}; do
    if pgrep -x hyprpaper > /dev/null; then
        break
    fi
    sleep 0.1
    if [ $i -eq 30 ]; then
        echo "Timed out waiting for hyprpaper"
        exit 1
    fi
done

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" ! -name "empty.png" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper wallpaper ,"$WALLPAPER",
