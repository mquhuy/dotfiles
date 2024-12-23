#!/bin/bash
#
title="Choose repo to open"

get_repo_list() {
  org=${1:-metal3-io}
  cache_file="$HOME/.${org}.github"
  if [ -f ${cache_file} ]; then
    age=$(($(date +%s) - $(date +%s -r "$cache_file")))
    if [[ ! age -gt 86400*7 ]]; then
      data=$(cat ${cache_file})
      if [[ "${data}" != "" ]]; then
        echo "${data}"
        return
      fi
    fi
  fi
  repos=$(gh repo list ${org} --limit 400 --json url | jq -r '.[].url')
  echo ${repos} >>${cache_file}
  echo ${repos}
}

repos=($(get_repo_list "nordix"))
repos+=($(get_repo_list "metal3-io"))

repo=$(printf "%s\n" "${repos[@]}" | rofi -dmenu -window-title $title -theme Adapta-Nokto)
if [[ ${repo} == "" ]]; then
  exit 0
fi

start-or-focus.sh est-browser
est-browser "${repo}"
