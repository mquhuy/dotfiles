#!/bin/bash
#
mkdir -p $HOME/Programs
rm -rf $HOME/Programs/k9s $HOME/.local/bin/k9s
__dir__=$(realpath $(dirname $0))
source $__dir__/common_lib.sh

org="kdash-rs"
repo="kdash"
tag=$(get_latest_release $org $repo)
echo $tag

if [ $tag = "null" ]; then
  exit 1
fi
filename="kdash-linux-musl.tar.gz"
#
wget "https://github.com/${org}/${repo}/releases/download/${tag}/${filename}"
tar -xf "$filename" -C $HOME/Programs/
ln -s $HOME/Programs/kdash $HOME/.local/bin/
rm "$filename"
