#!/bin/bash
#
command=$1
mkdir -p $HOME/.wid
wid_filename=${2:-$command}
last_focused_wid_file=$HOME/.wid/last_focused_window_id
wid_file=$HOME/.wid/$(echo $wid_filename <<< md5sum | cut -d ' ' -f 1)
FOCUSED_WINDOW_ID=$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $NF}')
if [ -f $wid_file ]; then
    window_id=$(cat $wid_file)
    if [[ $window_id == $FOCUSED_WINDOW_ID ]]; then
        if [ -f $last_focused_wid_file ]; then
            last_window_id=$(cat $last_focused_wid_file)
            i3-msg "[id=$last_window_id] focus"
        fi
        last_window_id=$(cat $last_focused_wid_file)
        exit 0
    fi
    echo $FOCUSED_WINDOW_ID > $last_focused_wid_file
    focus=$(i3-msg "[id=$window_id] focus")
    if [[ $(echo ${focus} | jq .[0].success) == "true" ]]; then
        exit 0
    fi
fi
window_id=$(printf '0x%08x\n' "$(i3-msg -q "exec --no-startup-id \"$command\"" && i3-msg -t subscribe '[ "window" ]' | sed -n 's/.*"window":\([0-9]\+\).*/\1/p')")
echo $window_id > $wid_file
echo $FOCUSED_WINDOW_ID > $last_focused_wid_file
i3-msg "[id=$window_id] focus"
