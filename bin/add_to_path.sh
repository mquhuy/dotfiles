#!/bin/bash
#
__dir__=$(realpath $(dirname $( readlink $0)))
cd $__dir__
bin_file=$(ls | fzf)
ln -s $__dir__/$bin_file $HOME/.local/bin/

