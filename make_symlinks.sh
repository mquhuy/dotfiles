#!/bin/bash
#
# get bash script directory
__dir__=$(realpath $(dirname $0))
ANSIBLE_DIR="${__dir__/ansible}"

if [[ $SHELL =~ ".*bash" ]]; then
	# if we're in a bash shell, we need to use the right shell
	if [ ! -d $HOME/.oh-my-bash ]; then
		rm -rf $HOME/.oh-my-bash
	fi
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
	rm -f $HOME/.bashrc
	ln -s $__dir__/bash/bashrc $HOME/.bashrc
fi
if [[ $SHELL =~ ".*zsh" ]]; then
	# if we're in a bash shell, we need to use the right shell
	#
	if [ ! -d $HOME/.oh-my-zsh ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		rm -f $HOME/.zshrc $HOME/.zshrc.pre-oh-my-zsh
		ln -s $__dir__/zsh/zshrc $HOME/.zshrc
		git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
		git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/themes/powerlevel10k
		rm -f $HOME/.p10k.zsh
		ln -s $__dir__/zsh/p10k.zsh $HOME/.p10k.zsh
	fi
fi
if [ ! -f $HOME/.tmux.conf ]; then
	rm -f $HOME/.tmux.conf
	ln -s $__dir__/tmux/tmux.conf $HOME/.tmux.conf
	rm -rf $HOME/.tmux
	mkdir -p $HOME/.tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ ! -f $HOME/.config/systemd/user/syncthing.service ]; then
	mkdir -p $HOME/.config/systemd/user
	ln -s $__dir__/syncthing/syncthing.service $HOME/.config/systemd/user/syncthing.service
fi
for f in $(ls $__dir__/bin); do
	if [ ! -f $HOME/.local/bin/$f ]; then
		ln -s $__dir__/bin/$f $HOME/.local/bin/$f
	fi
done
