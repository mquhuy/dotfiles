#!/bin/bash

mkdir -p $HOME/.local/bin
mkdir -p $HOME/Programs

__dir__=$(realpath $(dirname $0))
installer_dir=$__dir__/installers

$installer_dir/install_om.sh
$installer_dir/install_tmux.sh
$installer_dir/install_nvim.sh
$installer_dir/install_go.sh
$installer_dir/install_lazygit.sh
$installer_dir/install_k9s.sh
$installer_dir/install_gh.sh
$installer_dir/install_nvm.sh

ln -s $__dir__/bin/clone $HOME/.local/bin/
ln -s $__dir__/bin/recheckout_gh.sh $HOME/.local/bin/recheckout_pr
ln -s $__dir__/config $HOME/.config
