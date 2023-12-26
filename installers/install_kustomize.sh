#!/bin/bash

__dir__=$(realpath $(dirname $0))
source $__dir__/common_lib.sh
dest="$HOME/Programs/kustomize"
USER="kubernetes-sigs"
REPO="kustomize"
api="https://api.github.com/repos/${USER}/${REPO}/releases"
curl -sL "${api}" > releases.txt
version=$(cat releases.txt | jq -r ".[].tag_name" | grep "kustomize/" | head -n 1)
chosen_packaged=$(cat releases.txt | jq -r ".[] | select(.tag_name==\""${version}"\").assets[] | select(.name | test(\".*linux_amd64.*\"))")

package_name=$(echo ${chosen_packaged} | jq -r ".name")
tarball_url=$(echo ${chosen_packaged} | jq -r ".browser_download_url")
wget "${tarball_url}"

tar -xf "${package_name}"

mv kustomize $dest

chmod +x $dest
ln -s $dest ~/.local/bin

# rm -f ${package_name}
