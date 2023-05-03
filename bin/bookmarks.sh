#!/bin/bash

BOOKMARK_LIST=bookmarks.txt
__dir__=$(realpath $(dirname $0))
if [[ -L $0 ]]; then
    __dir__=$(realpath $(dirname $(readlink -f $0)))
fi
source "${__dir__}/../bin_lib/fzf_lib.sh"
link=$(fzf_choose $BOOKMARK_LIST "Bookmark")
if [[ $link == "" ]]; then
    exit 0
fi
# firefox -P default-release $link
microsoft-edge-stable $link
#surf $link
