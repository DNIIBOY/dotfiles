#!/bin/bash

USERNAME="DNIIBOY"  # Use first argument or default to DNIIBOY
API_KEY=$(cat .lastfm_key)
API_URL="https://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=$USERNAME&api_key=$API_KEY&format=json&limit=1"

CACHE_FILE="/tmp/lastfm_nowplaying.json"
CACHE_DURATION=4  # seconds

fetch_data() {
    curl -sL "$API_URL" > "$CACHE_FILE"
}

# Check if cache file exists and is recent
if [ ! -f "$CACHE_FILE" ] || [ $(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0))) -gt $CACHE_DURATION ]; then
    fetch_data
fi

# Get the currently playing track data
track_data=$(jq '.recenttracks.track[] | select(."@attr".nowplaying == "true")' "$CACHE_FILE" 2>/dev/null)

if [ -n "$track_data" ]; then
    case "$1" in
        "name")
            echo "$track_data" | jq -r '.name'
            ;;
        "artist")
            echo "$track_data" | jq -r '.artist["#text"]'
            ;;
        "cover")
            cover_img_loc="$(echo "$track_data" | jq -r '.image[] | select(.size == "medium") | ."#text"')"
            cover_img_name="${cover_img_loc##*/}"
            if [ ! -f "/tmp/$cover_img_name" ]; then
                curl -sL "$cover_img_loc" > "/tmp/${cover_img_name}"
            fi
            echo "/tmp/$cover_img_name"
            ;;
        *)
            echo "Usage: $0 {name|artist|cover}"
            exit 1
            ;;
    esac
else
    echo ""
fi
