#!/bin/bash
#
mkdir -p $HOME/Programs
rm -rf $HOME/Programs/src $HOME/.local/bin/src
__dir__=$(realpath $(dirname $0))
source ${__dir__}/common_lib.sh
org="sourcegraph"
repo="src-cli"
tag=$(get_latest_release $org $repo)
echo $tag

if [ $tag = "null" ]; then
  exit 1
fi

filename="src-cli_$(echo $tag | sed 's/v//g')_linux_amd64"

wget -O $HOME/Programs/$filename.tar.gz "https://github.com/${org}/${repo}/releases/download/${tag}/${filename}.tar.gz"

tar -xf $HOME/Programs/$filename.tar.gz -C $HOME/Programs
rm -f $HOME/Programs/$filename.tar.gz
ln -s $HOME/Programs/src $HOME/.local/bin/src
