#!/bin/bash
#
__dir__=$(realpath $(dirname $0))
source $__dir__/common_lib.sh
mkdir -p $HOME/Programs

rm -rf $HOME/.local/bin/kind $HOME/Programs/kind
USER="kubernetes-sigs"
REPO="kind"

version=$(get_latest_release $USER $REPO)

filename="kind-linux-amd64"
wget -O $HOME/Programs/kind "https://github.com/$USER/$REPO/releases/download/${version}/${filename}"

chmod +x $HOME/Programs/kind

ln -s $HOME/Programs/kind $HOME/.local/bin/kind
# https://github.com/kubernetes-sigs/kind/releases/download/v0.20.0/kind-linux-amd64
