#!/usr/bin/env bash

weather=$(curl -sL wttr.in/Aalborg?format="%c%t")

# Emoji to Nerd Font map
declare -A emoji_map=(
    ["✨"]=""
    ["☁️"]=""
    ["🌫"]=""
    ["❄️"]=""
    ["🌦"]=""
    ["🌧"]=""
    ["⛅️"]=""
    ["☀️"]=""
    ["🌩"]=""
    ["⛈"]=""
    ["☁️"]=""
)

output="$weather"
for emoji in "${!emoji_map[@]}"; do
    output="${output//${emoji}/${emoji_map[$emoji]}}"
done

output=$(echo "$output" | tr -d '+')

echo "$output"
