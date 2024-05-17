#!/bin/bash
#
PATH_ARR=(${PATH//:/ })
declare -a BIN
for d in "${PATH_ARR[@]}"; do
    BIN+=($(ls $d))
done
chosen_item=$(printf '%s\n' "${BIN[@]}" | rofi -dmenu -window-title "Start or switch to" -i -theme Adapta-Nokto -format d)
if [[ $chosen_item == "" ]]; then
    exit 0
fi
start-or-focus.sh $chosen_item
