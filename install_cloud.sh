#!/bin/bash

__dir__=$(realpath $(dirname $0))
installer_dir=$__dir__/installers
cd $installer_dir

./install_om.sh
./install_nvim.sh
./install_go.sh
./install_lazygit.sh
./install_k9s.sh
ln -s $__dir__/bin/clone $HOME/.local/bin/
