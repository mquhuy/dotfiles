#!/bin/bash
#
__dir__=$(realpath $(dirname $0))
source $__dir__/common_lib.sh

version=$(get_latest_release "nvm-sh" "nvm")
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${version}/install.sh | bash

source ~/.zshrc
nvm install --lts
nvm use --lts
