#!/bin/bash
#
source common_lib.sh

version=$(get_latest_release "nvm-sh" "nvm")
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${version}/install.sh | bash
