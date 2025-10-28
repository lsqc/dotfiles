#!/bin/bash

TIMESTAMP=$(date +"%Y-%m-%d_%H.%M.%S")
F_PATH="$HOME/Pictures/screenshots/Screenshot_$TIMESTAMP.png"

sleep 0.3
scrot -s "$F_PATH" || exit 1

O_PATH="${F_PATH%.png}-fs8.png"

pngquant --force --output "$O_PATH" "$F_PATH" && \
xclip -selection clipboard -t image/png -i "$O_PATH"

scp -i ~/.ssh/screenshot_key "$F_PATH" \
    "$USER@files.nya.vodka:/mnt/lsd4/personal/$USER/screenshots/"

