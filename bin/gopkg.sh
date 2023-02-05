#!/usr/bin/bash

path=$(readlink -f "${BASH_SOURCE:-$0}")
DIR=$(dirname $path)
PACKAGES_FILE=${DIR}/gopkgs.txt

pkg_name=$(cat $PACKAGES_FILE | rofi -dmenu)

if [ ${pkg_name} != "" ]; then
    firefox "https://pkg.go.dev/${pkg_name}"
fi
