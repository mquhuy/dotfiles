#!/bin/bash
#
#
sudo apt update
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev -y

DIR=$HOME/Programs/i3
git clone https://github.com/i3/i3 $DIR
cd $DIR
mkdir -p build && cd build
meson ..
ninja

i3_files=( "i3", "i3bar", "i3-config-wizard", "i3-dump-log", "i3-input", "i3-msg", "i3-nagbar")
for i3_file in i3_files; do
  sudo rm -f /usr/bin/$i3_file
  sudo cp $DIR/build/$i3_file /usr/bin
done

sudo apt install --reinstall i3blocks

rm -rf $DIR
