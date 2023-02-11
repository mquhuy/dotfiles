#!/bin/bash
#
mkdir -p $HOME/Programs
rm -rf $HOME/Programs/k9s $HOME/.local/bin/k9s
__dir__=$(realpath $(dirname $0))
source ${__dir__}/common_lib.sh
org="tree-sitter"
repo="tree-sitter"
tag=$(get_latest_release $org $repo)
echo $tag

if [ $tag = "null" ]; then
  exit 1
fi

wget "https://github.com/${org}/${repo}/releases/download/${tag}/tree-sitter-linux-x64.gz"

gzip -d tree-sitter-linux-x64.gz
chmod +x tree-sitter-linux-x64
mv tree-sitter-linux-x64 $HOME/Programs/tree-sitter
ln -s $HOME/Programs/tree-sitter $HOME/.local/bin/
