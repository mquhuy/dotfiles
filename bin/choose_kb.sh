#!/usr/bin/env bash
KMONAD_CONFIG_DIR=${DOTFILES_DIR}/kmonad
chosen_keyboard=$(ls ${KMONAD_CONFIG_DIR}/*.org | fzf)
emacs --batch --eval "(require 'org)" --eval "(org-babel-tangle-file \"${chosen_keyboard}\")"
systemctl --user restart kmonad
