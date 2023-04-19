#!/bin/bash
#
mkdir -p $HOME/Programs
rm -rf $HOME/Programs/k9s $HOME/.local/bin/k9s
__dir__=$(realpath $(dirname $0))
source $__dir__/common_lib.sh
org="derailed"
repo="k9s"
tag=$(get_latest_release $org $repo)
echo $tag

if [ $tag = "null" ]; then
  exit 1
fi

wget "https://github.com/${org}/${repo}/releases/download/${tag}/k9s_Linux_amd64.tar.gz"

tar -xf k9s_Linux_amd64.tar.gz -C $HOME/Programs/
ln -s $HOME/Programs/k9s $HOME/.local/bin/
rm k9s_Linux_amd64.tar.gz
rm -rf ~/Programs/README.md ~/Programs/LICENSE
