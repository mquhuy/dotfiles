#!/bin/bash

__dir__=$(realpath $(dirname $0))
if [[ ! -d $HOME/.oh-my-zsh ]]; then
  result=$(sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
  echo "ohmyzsh installation exits with code ${result}"
fi
rm -f "${HOME}/.zshrc" "${HOME}/.zshrc.pre-oh-my-zsh"
ln -s "${__dir__}/../zsh/zshrc" "${HOME}/.zshrc"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "${HOME}/.oh-my-zsh/plugins/zsh-syntax-highlighting"
git clone https://github.com/romkatv/powerlevel10k.git "${HOME}/.oh-my-zsh/themes/powerlevel10k"
rm -f "${HOME}/.p10k.zsh"
ln -s "${__dir__}/../zsh/p10k.zsh" "${HOME}/.p10k.zsh"
