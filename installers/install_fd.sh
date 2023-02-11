#!/bin/bash
#
__dir__=$(realpath $(dirname $0))
source ${__dir__}/common_lib.sh

version=$(get_latest_release "sharkdp" "fd")
echo $version
filename="fd-musl_$(echo $version | sed 's/v//g')_amd64.deb"
wget -O fd.deb "https://github.com/sharkdp/fd/releases/download/${version}/${filename}"
sudo dpkg -i fd.deb
rm -f fd.deb
