#!/bin/bash
#
__dir__=$(realpath $(dirname $0))
source $__dir__/common_lib.sh
mkdir -p $HOME/Programs

rm -rf $HOME/.local/bin/gh $HOME/Programs/gh

version=$(get_latest_release "sharkdp" "fd")

echo $version

filename="fd-musl_$(echo $version | sed 's/v//g')_amd64.deb"
wget -O $HOME/Programs/$filename "https://github.com/sharkdp/fd/releases/download/${version}/${filename}"

sudo dpkg -i $HOME/Programs/$filename

rm -f $HOME/Programs/$filename
