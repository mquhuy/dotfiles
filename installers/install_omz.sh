#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		rm -f $HOME/.zshrc $HOME/.zshrc.pre-oh-my-zsh
		ln -s $__dir__/zsh/zshrc $HOME/.zshrc
		git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
		git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/themes/powerlevel10k
		rm -f $HOME/.p10k.zsh
		ln -s $__dir__/zsh/p10k.zsh $HOME/.p10k.zsh

