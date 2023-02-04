#!/bin/bash
#
cd $HOME/Programs/
git clone https://github.com/udhos/update-golang.git
cd update-golang
sudo ./update-golang.sh
rm -rf $HOME/Programs/update-golang
