#!/bin/bash

dest="$HOME/Programs/kubectl"
wget "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

mv kubectl $dest

chmod +x $dest
ln -s $dest ~/.local/bin
