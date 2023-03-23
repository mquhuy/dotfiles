#!/bin/bash

LIST_FILES_DIR="$DOTFILES_DIR/TxtLists"
choose() {
    LIST_FILE=$1
    LIST_FILE="${LIST_FILES_DIR}/${LIST_FILE}"
    ITEM=$2
    exists=$(awk -F';' '{print $1}' $LIST_FILE | grep $ITEM)
    if [[ $exists == "" ]]; then
        exit 0
    fi
    link=$(grep $ITEM $LIST_FILE | awk -F';' '{print $2}')
    echo $link
}

fzf_choose() {
    LIST_FILE=$1
    LIST_FILE="${LIST_FILES_DIR}/${LIST_FILE}"
    title=${2:-""}
    chosen_idx=$(awk -F';' '{print $1}' $LIST_FILE | rofi -dmenu -window-title $title -i -theme Adapta-Nokto -format d)
    if [[ $chosen_idx == "" ]]; then
        return
    fi
    second_col=$(cat $LIST_FILE | head -n $chosen_idx | tail -n 1 | awk -F';' '{print $2}')
    echo $second_col
}
