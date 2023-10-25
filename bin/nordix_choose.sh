#!/bin/bash
#
title="Choose repo to open"

get_repo_list() {
    org=${1:-metal3-io}
    cache_file="$HOME/.${org}.github"
    if [ -f ${cache_file} ]; then
        age=$(($(date +%s) - $(date +%s -r "$cache_file")))
        if [[ ! age -gt 86400 ]]; then
            cat ${cache_file}
            return
        fi
    fi
    gh repo list ${org} --limit 400 --json url | jq -r '.[].url' | tee ${cache_file}
}

repos=($(get_repo_list "nordix"))
repos+=($(get_repo_list "metal3-io"))

repo=$(printf "%s\n" "${repos[@]}" | rofi -dmenu -window-title $title -theme Adapta-Nokto)

microsoft-edge-stable $repo
