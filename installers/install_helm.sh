#!/bin/bash
#
__dir__=$(realpath $(dirname $0))
source $__dir__/common_lib.sh
mkdir -p $HOME/Programs

rm -rf $HOME/.local/bin/helm $HOME/Programs/linux-amd64

version=$(get_latest_release "helm" "helm")
filename="helm-${version}-linux-amd64.tar.gz"
wget -O $HOME/Programs/$filename.tar.gz "https://get.helm.sh/${filename}"

tar -xf $HOME/Programs/$filename.tar.gz -C $HOME/Programs

rm -f $HOME/Programs/$filename.tar.gz
ln -s $HOME/Programs/linux-amd64/helm $HOME/.local/bin/helm
