#!/bin/bash
#
#
sudo apt update
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

DIR=$HOME/Programs/i3
git clone https://github.com/i3/i3 $DIR
cd $DIR
mkdir -p build && cd build
meson ..
ninja

sudo rm -r /usr/bin/i3*
sudo cp i3* /usr/bin
