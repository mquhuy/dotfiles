#!/bin/bash
#
rm -rf $HOME/Programs/firefox* $HOME/.local/bin/firefox
dest="$HOME/Programs/firefox.bz2"
executable="$HOME/.local/bin/firefox"
package=$(curl -s https://download.mozilla.org/\?product\=firefox-latest\&os\=linux64\&lang\=en-US | awk -F'"' '{print $2}')

wget -O $dest $package

tar -xf $dest -C $HOME/Programs

ln -s $HOME/Programs/firefox/firefox $HOME/.local/bin
rm -f $dest
