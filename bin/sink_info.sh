#!/usr/bin/bash

headphone="alsa_output.usb-SteelSeries_Arctis_Pro_Wireless-00.mono-chat"
wrongheadphone="alsa_output.usb-SteelSeries_Arctis_Pro_Wireless-00.stereo-game"
loudspeaker="alsa_output.pci-0000_00_1f.3.analog-stereo"
office_sink="alsa_output.usb-GN_Audio_A_S_Jabra_EVOLVE_30_II_00038BF4A11207-00.analog-stereo"
JBL_sink="alsa_output.usb-JBL_Quantum_800-00.analog-stereo"

trigger_i3blocks() {
    pkill -SIGRTMIN+2 i3blocks
}

get_sinks() {
    pactl list sinks | grep Name: | awk -F: '{print $2}'
}

correct_default_sink() {
    correct_sink=$1
    sinks=$(get_sinks)
    current_sink=$(pactl info | grep "Default Sink" | awk -F: '{print $2}')
    if [[ ${sinks} != *${correct_sink}* || $current_sink == *$correct_sink* || $current_sink == *$loudspeaker* ]]; then
        return
    fi
    if [[ ${sinks} == *${correct_sink}* ]]; then
        pactl set-default-sink $correct_sink
        pactl set-sink-volume $correct_sink 100%
        notify-send -u low "Changed sink to $correct_sink"
    fi
}

increase_volume() {
    sink=$(pactl info | grep "Default Sink" | awk -F: '{print $2}')
    pactl set-sink-volume $sink +10%
    get_status
    #notify-send -u low -i audio-volume-zero-panel $volume -t 1000 -h string:x-canonical-private-synchronous:volume
}

decrease_volume() {
    sink=$(pactl info | grep "Default Sink" | awk -F: '{print $2}')
    pactl set-sink-volume $sink -10%
    get_status
    volume=$(pulsemixer --get-volume | awk '{print $1}')
    #notify-send -u low -i audio-volume-zero-panel $volume -t 1000 -h string:x-canonical-private-synchronous:volume
}

get_status() {
    info=""
    state=$(pulsemixer --get-mute)
    if [ "${state}" = "1" ]; then
        info="${info}🔇"
    fi
    sink=$(pactl info | grep "Default Sink" | awk -F: '{print $2}')
    correct_default_sink $headphone
    correct_default_sink $JBL_sink
    sink=$(pactl info | grep "Default Sink" | awk -F: '{print $2}')
    volume=$(pulsemixer --get-volume | awk '{print $1}')
    if [[ $sink == *$headphone* || $sink == *$JBL_sink* ]]; then
        info="${info}🎧 $volume"
    else
        pactl set-default-sink $loudspeaker
        info="${info}🔊 $volume"
    fi
    echo $info
}

toggle_mute() {
    state=$(pulsemixer --get-mute)
    if [ "${state}" = "0" ]; then
        pulsemixer --mute
        notify-send -u low -i audio-volume-muted "Volume muted" -t 1000 -h string:x-canonical-private-synchronous:volume
    else
        pulsemixer --unmute
        notify-send -u low -i audio-volume-zero-panel "Volume unmuted" -t 1000 -h string:x-canonical-private-synchronous:volume
    fi
    get_status
}

toggle_sink() {
    sink=$(pactl info | grep "Default Sink" | awk -F: '{print $2}')
    mute_state=$(pulsemixer --get-mute)
    if [ $sink == $headphone ]; then
        pactl set-default-sink $loudspeaker
        notify-send -u low -i ~/icons/loud-speaker.png "Switched to loud speaker" -t 1000 -h string:x-canonical-private-synchronous:volume
    elif [ $sink == $loudspeaker ]; then
        pactl set-default-sink $headphone
        #notify-send -u low -i audio-volume-zero-panel "Switched to Headset" -t 1000 -h string:x-canonical-private-synchronous:volume
        notify-send -u low -i ~/icons/headset.png "Switched to Headset" -t 1000 -h string:x-canonical-private-synchronous:volume
    fi
    if [ "${mute_state}" = "0" ]; then
        pulsemixer --unmute
    else
        pulsemixer --mute
    fi
    get_status
}

case $BLOCK_BUTTON in
    1)
        toggle_sink
        trigger_i3blocks
        ;;
    2)
        toggle_mute
        trigger_i3blocks
        ;;
    3)
        toggle_mute
        trigger_i3blocks
        ;;
    4)
        increase_volume
        trigger_i3blocks
        ;;
    5)
        decrease_volume
        trigger_i3blocks
        ;;
    *)
        get_status
esac
