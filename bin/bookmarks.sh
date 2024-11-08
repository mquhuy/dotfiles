#!/bin/bash

BOOKMARK_LIST=bookmarks.txt
__dir__=$(realpath $(dirname $0))
if [[ -L $0 ]]; then
    __dir__=$(realpath $(dirname $(readlink -f $0)))
fi
source "${__dir__}/../bin_lib/fzf_lib.sh"
output=$(fzf_choose $BOOKMARK_LIST "Bookmark")
if [[ $output == "" ]]; then
    exit 0
fi
link=$(echo $output | awk -F';' '{print $1}')
browser=$(echo $output | awk -F';' '{print $2}')
if [[ $browser == "" ]]; then
    browser="${DEFAULT_BROWSER:-"est-browser"}"
fi
# start-or-focus-sway.sh $browser
$browser $link
