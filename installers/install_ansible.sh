#!/usr/bin/env bash

sudo apt install -y python3-pip ansible

ansible-galaxy collection install community.general

pip install github3.py --break-system-packagess
