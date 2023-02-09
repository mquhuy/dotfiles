#!/bin/bash
#
sudo apt remove --autoremove emacs emacs-common
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs28
git clone --depth 1 --single-branch https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
