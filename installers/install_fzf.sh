#!/bin/bash
#
__dir__=$(realpath $(dirname $0))
source $__dir__/common_lib.sh
mkdir -p $HOME/Programs

rm -rf $HOME/.local/bin/fzf $HOME/Programs/fzf
user="junegunn"
repo="fzf"

version=$(get_latest_release ${user} ${repo})

filename="fzf-${version#v}-linux_amd64"
wget -O $HOME/Programs/$filename.tar.gz "https://github.com/${user}/${repo}/releases/download/${version}/${filename}.tar.gz"

tar -xf $HOME/Programs/$filename.tar.gz -C $HOME/Programs

rm -f $HOME/Programs/$filename.tar.gz
ln -s $HOME/Programs/fzf $HOME/.local/bin/fzf
