#!/bin/bash
#
# __dir__=$(realpath $(dirname $0))
# source $__dir__/common_lib.sh
#
# GH_user="denoland"
# GH_project="deno"
# version=$(get_latest_release "$GH_user" "$GH_project")
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${version}/install.sh | bash
#
# source ~/.bashrc
# nvm install --lts
# nvm use --lts
curl -fsSL https://deno.land/x/install/install.sh | sh
