#!/bin/bash

__dir__=$(realpath $(dirname $0))
source "${__dir__}/../bin_lib/fzf_lib.sh"
repo=$(fzf_choose "repos.txt" "Repo Name")
if [[ $repo == "" ]]; then
    echo $repo
    exit 0
fi
xdotool type "git clone $repo"
xdotool key Return --delay 50
