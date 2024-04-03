#!/bin/bash
#
command=$1
mkdir -p $HOME/.wid
wid_file=$HOME/.wid/$(echo $command <<< md5sum | cut -d ' ' -f 1)
if [ -f $wid_file ]; then
    window_id=$(cat $wid_file)
    focus=$(i3-msg "[id=$window_id] focus")
    if [[ $(echo ${focus} | jq .[0].success) == "true" ]]; then
        exit 0
    fi
fi
window_id=$(printf '0x%08x\n' "$(i3-msg -q "exec --no-startup-id \"$command\"" && i3-msg -t subscribe '[ "window" ]' | sed -n 's/.*"window":\([0-9]\+\).*/\1/p')")
echo $window_id > $wid_file
i3-msg "[id=$window_id] focus"
