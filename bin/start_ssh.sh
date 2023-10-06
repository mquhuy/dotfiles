#!/usr/bin/env bash
#
hostname=$(ssh-config ls | rofi -dmenu)
gnome-terminal --profile SSH -- ssh "${hostname}"
