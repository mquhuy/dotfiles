rm -rf $HOME/.tmux
mkdir -p $HOME/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm -f $HOME/.tmux.conf
ln -s $__dir__/tmux/tmux.conf $HOME/.tmux.conf
$HOME/.tmux/plugins/tpm/bin/install_plugins
