#!/bin/bash

function get_latest_release() {
  org=$1
  repo=$2
  api="https://api.github.com/repos/${org}/${repo}/releases"
  set +x
  curl -sL "${api}" > releases.txt
  release_tag="$(cat releases.txt | jq -r ".[].tag_name" | head -n 1 )"

  echo "$release_tag"
  rm -f releases.txt
}

