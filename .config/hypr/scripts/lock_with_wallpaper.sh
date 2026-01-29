#!/bin/bash
CURRENT_WALLPAPER=$(hyprctl hyprpaper listactive | head -1 | awk '{print $3}')
CURRENT_WALLPAPER="~/Pictures/wallpapers/tt.png"

sed -i "s|wallpaper = .*|wallpaper = $CURRENT_WALLPAPER|" ~/.config/hypr/hyprlock.conf

hyprlock
