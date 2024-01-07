#!/bin/bash
#
MONITOR_CHAR='\U0001f5b5'
LAPTOP_CHAR='\U0001f4bb'
current_setup=$(xrandr --listmonitors | grep "Monitors" | awk -F":" '{print $2}' | xargs)

status() {
    case $current_setup in
        1)
            echo -e ${LAPTOP_CHAR}
            ;;
        *)
            echo -e ${MONITOR_CHAR}
            ;;
    esac
}

switch() {
    case $current_setup in
        1)
            ${HOME}/.screenlayout/2-screen.sh
            ;;
        *)
            ${HOME}/.screenlayout/1-screen.sh
            ;;
    esac
}

start_arandr() {
    arandr
}

trigger_i3blocks() {
    pkill -SIGRTMIN+30 i3blocks
    status
}

case ${BLOCK_BUTTON:-} in
    1)
      switch
      trigger_i3blocks
      ;;
    3)
      arandr
      ;;
    *)
      status
      ;;
esac
