#!/bin/env bash

current_ws=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name')
all_ws=$(i3-msg -t get_workspaces | jq '.[].name')
