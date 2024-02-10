#!/usr/bin/env bash
#
# The script uses  ssh-config  to list all the hosts in the  ~/.ssh/config  file and then uses  rofi  to display a list of hosts. When a host is selected, the script uses  kitty  to open a new terminal window and connect to the selected host. 
# The  ssh-config  command is a custom script that I wrote to list all the hosts in the  ~/.ssh/config  file. 
hostname=$(ssh-config ls | rofi -dmenu)
# gnome-terminal --profile SSH -- ssh "${hostname}"
kitty kitten ssh "${hostname}"
