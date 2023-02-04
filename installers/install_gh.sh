#!/bin/bash
#
source common_lib.sh
mkdir -p $HOME/Programs

rm -rf $HOME/.local/bin/gh $HOME/Programs/gh

version=$(get_latest_release "cli" "cli")

filename="gh_$(echo $version | sed 's/v//g')_linux_amd64"

wget -O $HOME/Programs/$filename.tar.gz "https://github.com/cli/cli/releases/download/${version}/${filename}.tar.gz"

tar -xf $HOME/Programs/$filename.tar.gz -C $HOME/Programs

mv $HOME/Programs/$filename $HOME/Programs/gh

rm -f $HOME/Programs/$filename.tar.gz
ln -s $HOME/Programs/gh/bin/gh $HOME/.local/bin/gh
