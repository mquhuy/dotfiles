#!/bin/bash
#

wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O code.deb

sudo dpkg -i code.deb

rm -f code.deb
