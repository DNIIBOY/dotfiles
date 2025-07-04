#!/bin/bash

previous_window_count=-1
previous_workspace=-1

while true; do
    # Get current workspace info
    workspace_info=$(hyprctl activeworkspace -j 2>/dev/null)
    if [ $? -eq 0 ] && [ -n "$workspace_info" ]; then
        # Extract window count and workspace ID
        window_count=$(echo "$workspace_info" | jq -r '.windows // 0' 2>/dev/null)
        workspace_id=$(echo "$workspace_info" | jq -r '.id // 0' 2>/dev/null)
        # Ensure we have valid numbers
        if ! [[ "$window_count" =~ ^[0-9]+$ ]]; then
            window_count=0
        fi
        if ! [[ "$workspace_id" =~ ^[0-9]+$ ]]; then
            workspace_id=0
        fi
        # Check if state changed
        if [ "$window_count" != "$previous_window_count" ] || [ "$workspace_id" != "$previous_workspace" ]; then
            echo "$(date '+%H:%M:%S') - Workspace $workspace_id: $window_count windows"
            if [ "$window_count" -eq 0 ]; then
                # Workspace is empty - hide waybar
                if pgrep waybar > /dev/null 2>&1; then
                    echo "  → Hiding Waybar (empty workspace)"
                    pkill waybar
                fi
            else
                # Workspace has windows - show waybar
                if ! pgrep waybar > /dev/null 2>&1; then
                    echo "  → Showing Waybar (occupied workspace)"
                    # Start waybar in background, suppress output
                    nohup waybar >/dev/null 2>&1 &
                    # Small delay to let waybar start
                    sleep 0.2
                fi
            fi
            previous_window_count="$window_count"
            previous_workspace="$workspace_id"
        fi
    else
        echo "Warning: Could not get workspace info from hyprctl"
    fi
    sleep 0.3
done
