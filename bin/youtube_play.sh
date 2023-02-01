#!/bin/bash

link=$(xclip -o)
echo $link
if [[ $link != *"youtube.com"* ]]; then
    echo "no match"
    exit 0
fi
mpv $link
