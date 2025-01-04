#!/usr/bin/env bash

if [[ -d /run/current-system/sw/bin ]]; then
  exit 0
fi
sudo mkdir -p /run/current-system/sw/bin
sudo ln -s $(which sleep) /run/current-system/sw/bin
sudo ln -s $(which setxkbmap) /run/current-system/sw/bin
sudo chmod 777 /dev/input -R
sudo chmod 777 /dev/uinput -R
