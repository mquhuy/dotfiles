#!/bin/bash

BOOKMARK_LIST=bookmarks.txt
__dir__=$(realpath $(dirname $0))
source "${__dir__}/../bin_lib/fzf_lib.sh"
link=$(fzf_choose $BOOKMARK_LIST "Bookmark")
if [[ $link == "" ]]; then
    exit 0
fi
firefox -P default-release $link
#surf $link
