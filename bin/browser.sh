#!/bin/env bash

url=${1:-}
echo "You clicked on: $url" >> ~/clicked_urls.txt
cd $HOME/dotfiles/bin || exit 0
browser=$(python3 browser.py "${url}")
echo "$browser $url" >> ~/clicked_urls.txt
start-or-focus.sh ${browser}
${browser} ${url}
