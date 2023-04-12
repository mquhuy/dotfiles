#!/bin/bash
#
mkdir -p $HOME/Programs

rm -rf $HOME/.local/bin/nvim $HOME/Programs/nvim

version="stable"

filename="nvim-linux64"

wget -O $HOME/Programs/$filename.tar.gz "https://github.com/neovim/neovim/releases/download/${version}/${filename}.tar.gz"

tar -xf $HOME/Programs/$filename.tar.gz -C $HOME/Programs

mv $HOME/Programs/$filename $HOME/Programs/nvim

rm -f $HOME/Programs/$filename.tar.gz
ln -s $HOME/Programs/nvim/bin/nvim $HOME/.local/bin/nvim

__dir__=$(realpath $(dirname $0))
NVIM=$(realpath ${__dir__/../nvim})

mkdir -p ~/.config
rm -rf ~/.config/nvim
ln -s $NVIM ~/.config/
