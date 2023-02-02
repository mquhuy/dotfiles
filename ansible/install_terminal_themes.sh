#!/bin/bash
#
mkdir -p "$HOME/Programs"
cd "$HOME/Programs"
git clone https://github.com/Gogh-Co/Gogh.git gogh
cd gogh

# necessary in the Gnome terminal on ubuntu
export TERMINAL=gnome-terminal

# necessary in the Alacritty terminal
pip install -r requirements.txt
export TERMINAL=alacritty

# Enter themes dir
cd themes

# install themes
./atom.sh
./dracula.sh
