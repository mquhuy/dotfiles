#!/bin/bash
#
command=$1
mkdir -p /tmp/.wid
logfile="/tmp/start-or-focus-sway.log"
wid_filename=${2:-$command}
last_focused_wid_file=/tmp/.wid/last_focused_window_id
wid_file=/tmp/.wid/$(echo $wid_filename <<< md5sum | cut -d ' ' -f 1)

echo "Running command ${command}" >> ${logfile}
echo "wid_file: ${wid_file}" >> ${logfile}

focus() {
    window_id=$1
    swaymsg "[con_id=${window_id}] focus"
    swaymsg "[con_id=${window_id}] floating disable"
}

get_focused_window_id() {
    swaymsg -t get_tree | jq -r '.. | select(.type? == "con" and .focused == true).id'
}

FOCUSED_WINDOW_ID=$(get_focused_window_id)
echo $FOCUSED_WINDOW_ID > $last_focused_wid_file

if [ -f $wid_file ]; then
    window_id=$(cat $wid_file)
    echo "Window id: ${window_id}" >> ${logfile}
    if [[ $(get_focused_window_id)  == $window_id ]]; then
        swaymsg "[con_id=${window_id}] move scratchpad"
        exit 0
    fi
    focus $window_id
    if [[ $(get_focused_window_id)  == $window_id ]]; then
        exit 0
    fi
fi

exec $command&
sleep 1
window_id=$(get_focused_window_id)

echo $window_id > $wid_file
focus $window_id
