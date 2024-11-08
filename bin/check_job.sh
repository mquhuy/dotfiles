#!/usr/bin/env bash

url="https://jenkins.nordix.org/view/Metal3/job/metal3-dev-env-integration-test-ubuntu-main/80/"

check_result() {
    url=${1:?}
    result=$(curl -s "${url}api/json" | jq .result | tr '[:upper:]' '[:lower:]')
    if [[ ${result} == "null" ]]; then
        return
    elif [[ ${result} == "pass" ]]; then
        notify-send "${ur} Passed"
        exit 0
    elif [[ ${result} == "fail" ]]; then
        notify-send "${ur} failed"
        exit 1
    else
        exit 1
    fi
}

url=$(wl-paste)
while true; do
    check_result $url
    sleep 30
done
