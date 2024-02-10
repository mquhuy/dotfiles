#!/bin/bash

output="${HOME}/screenshots/$(date +%Y-%m-%d-%H-%M-%S)_active.png"
shutter -a -e -n -o "${output}"
xclip -select clipboard -t image/png -i < "${output}"
notify-send "Screenshot stored to ${output} and copied to clipboard"
