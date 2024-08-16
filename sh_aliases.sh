alias ap="apropos"
alias eali="nvim $DOTFILES_DIR/sh_aliases.sh"
alias ebm="nvim $DOTFILES_DIR/TxtLists/bookmarks.txt"
alias seali="source $RCFILE"
alias v="OPENAI_API_KEY=${OPENAI_API_KEY} nvim"
alias wikio="cd ~/Nextcloud/zettelkasten && NVIM_APPNAME=nvim-writing nvim"
alias norg="cd ~/Nextcloud/norg && NVIM_APPNAME=nvim-norg nvim"
alias wiki="cd ~/Nextcloud/zettelkasten && NVIM_APPNAME=nvim-md nvim"
alias opd="cd ~/Repos/openstack"

# i3 config
alias i3config="nvim ~/.config/i3/config"
alias swayconfig="nvim ~/.config/sway/config"
alias i3wsconf="nvim ~/.config/i3/ws.conf"
alias i3bc="nvim ~/.config/i3blocks/primary.conf"
alias i3autoxrand="nvim ~/.config/i3/autoxrandr"

# Sway config
alias swayconfig="nvim ~/.config/sway/config"
alias waybarconfig="nvim ~/.config/waybar/config.jsonc"

# Vim config
alias vinit="nvim ~/.config/nvim/init.lua"

# tmux config
alias t="tmux"
alias tconf="nvim ~/.tmux.conf"

# Random
alias watch="watch "
alias r="ranger"
alias k="kubectl"
alias h="helm"

# Git
alias g="git"
alias gg="git grep"
alias ggo="grep_and_edit.sh"
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gl="git log"
alias gpr="git pull --rebase"
alias gcane="git commit --amend --no-edit"
alias gco="git checkout"
alias grecom="git commit -c ORIG_HEAD"
alias gcm="git commit -m"
alias gpomr="git pull origin main --rebase"
alias gpomr2="git pull origin master --rebase"
alias gpush="git push"
glist() { git diff-tree --no-commit-id --name-only -r "$1"; }
alias glisth="glist HEAD"
#gwta() { git worktree add ../"$1" -b "$1"; }

# find
alias fin="find -name"

# Docker
alias d="docker"
alias drfi="docker run --rm -it"

#directory
mkdcd() { mkdir "$1"; cd "$1"; }

#shortcut
# alias cdmgw="access_dir.sh ~/repos/mgw-branches"
# alias cdmgwm="cd ~/repos/mgw-branches/master"
# alias cdsbg="access_dir.sh ~/repos/sbg-branches"
# alias cdsbgm="cd ~/repos/sbg-branches/master"
# alias bb="ssh -t build-host zsh"
alias dl="cd ~/Downloads"

alias getkey="xev | grep keycode"
alias :o="xdg-open"
alias th="thunar .&"

alias setchrome="xdg-settings set default-web-browser google-chrome.desktop"
alias setff="xdg-settings set default-web-browser firefox.desktop"
alias setbrave="xdg-settings set default-web-browser brave-browser.desktop"

alias screenoff="xset dpms force off"
alias tog="~/.local/bin/time_track.sh"
alias gitiles="~/.local/bin/gitiles"
alias lg="lazygit"
alias udf="pwd=$PWD && cd $DOTFILES_DIR && git pull && cd $pwd"
alias dfd="cd $DOTFILES_DIR"

# CAPS LOCK
alias capslock="xdotool key Caps_Lock"
alias CAPSLOCK="xdotool key Caps_Lock"
