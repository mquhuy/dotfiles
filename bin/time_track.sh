#!/bin/bash

get_status() {
    if [[ $(toggl ls | grep "running") != "" ]]; then
        get_time
    else
        echo "No work time"
    fi
}

toggle() {
    time=$(date +%Y%m%d%H%M)
    if [[ $(toggl ls | grep "running") != "" ]]; then
        toggl stop 2>&1 > /dev/null
        notify-send "Work time stopped at ${time}"
    else
        toggl start -o "Work time" 2>&1 > /dev/null
        notify-send "Work time started at ${time}"
    fi
}

toggle_with_input() {
    time=${1:-}
    if [[ ${time} != "" ]]; then
        time="$(date +%Y%m%d)${time}"
    else
        return
    fi
    if [[ $(toggl ls | grep "running") != "" ]]; then
        toggl stop --stop ${time} 2>&1 > /dev/null
        notify-send "Work time stopped at ${time}"
    else
        toggl start -o "Work time" --start ${time} 2>&1 > /dev/null
        notify-send "Work time started at ${time}"
    fi
}

get_time() {
    time=$(toggl sum | grep today | awk '{print $2}')
    if [[ $time == "" ]]; then
        echo "Forgot to stop yesterday's time?"
    else
        echo $time
    fi
}

generate_report() {
    echo "report"
}

non_click() {
    command=${1:-}
    case ${command} in
        "report")
            generate_report
            ;;
        "")
            get_status
            ;;
        *)
            toggle_with_input $command
            trigger_i3blocks
            ;;
    esac
}

trigger_i3blocks() {
    pkill -SIGRTMIN+20 i3blocks
    get_status
}

case ${BLOCK_BUTTON:-} in
    1)
      toggle
      trigger_i3blocks
      ;;
    3)
      input=$(free-input)
      toggle_with_input $input
      trigger_i3blocks
      ;;
    "")
      non_click "${1:-}"
      ;;
    *)
      get_status
      ;;
esac
