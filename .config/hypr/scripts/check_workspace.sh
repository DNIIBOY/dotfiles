#!/bin/bash
current_workspace=$(hyprctl activeworkspace -j | jq -r '.id')
window_count=$(hyprctl clients -j | jq "[.[] | select(.workspace.id == $current_workspace)] | length")


if [ "$window_count" -eq 0 ]; then
    echo '{"text": "", "class": "empty"}'
else
    echo '{"text": "", "class": "occupied"}'
fi
