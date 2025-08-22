alias ap="apropos"
alias eali="nvim $DOTFILES_DIR/sh_aliases.sh"
alias ebm="nvim $DOTFILES_DIR/TxtLists/bookmarks.txt"
alias seali="source $RCFILE"
alias v="OPENAI_API_KEY=${OPENAI_API_KEY} nvim"
alias wikio="cd $HOME/Nextcloud/zettelkasten && NVIM_APPNAME=nvim-writing nvim"
alias norg="cd $HOME/Nextcloud/norg && NVIM_APPNAME=nvim-norg nvim"
alias wiki="cd $HOME/Nextcloud/zettelkasten && NVIM_APPNAME=nvim-md nvim"
alias opd="cd $HOME/Repos/openstack"

# i3 config
alias i3config="nvim $HOME/.config/i3/config"
alias i3wsconf="nvim $HOME/.config/i3/ws.conf"
alias i3bc="nvim $HOME/.config/i3blocks/primary.conf"
alias i3autoxrand="nvim $HOME/.config/i3/autoxrandr"

# Sway config
alias swayconfig="nvim $HOME/.config/sway/config"
alias waybarconfig="nvim $HOME/.config/waybar/config.jsonc"

# Vim config
alias vinit="nvim $HOME/.config/nvim/init.lua"

# tmux config
alias t="tmux"
alias tconf="nvim $HOME/.tmux.conf"

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
alias gp="git pull"
alias gP="git push"
alias gpr="git pull --rebase"
alias gcane="git commit --amend --no-edit"
alias gco="git checkout"
alias grecom="git commit -c ORIG_HEAD"
alias gcm="git commit -m"
alias gpomr="git pull origin main --rebase"
alias gpomr2="git pull origin master --rebase"
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

alias sharescreenfix="dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway && systemctl --user stop pipewire.socket pipewire wireplumber xdg-desktop-portal xdg-desktop-portal-wlr && systemctl --user start wireplumber"
#shortcut
# alias cdmgw="access_dir.sh $HOME/repos/mgw-branches"
# alias cdmgwm="cd $HOME/repos/mgw-branches/master"
# alias cdsbg="access_dir.sh $HOME/repos/sbg-branches"
# alias cdsbgm="cd $HOME/repos/sbg-branches/master"
# alias bb="ssh -t build-host zsh"
alias dl="cd $HOME/Downloads"

alias getkey="xev | grep keycode"
alias :o="xdg-open"
alias th="thunar .&"

alias setchrome="xdg-settings set default-web-browser google-chrome.desktop"
alias setff="xdg-settings set default-web-browser firefox.desktop"
alias setbrave="xdg-settings set default-web-browser brave-browser.desktop"

alias screenoff="xset dpms force off"
alias tog="$HOME/.local/bin/time_track.sh"
alias gitiles="$HOME/.local/bin/gitiles"
alias lg="lazygit"
alias udf="pwd=$PWD && cd $DOTFILES_DIR && git pull && cd $pwd"
alias dfd="cd $DOTFILES_DIR"

# CAPS LOCK
alias capslock="xdotool key Caps_Lock"
alias CAPSLOCK="xdotool key Caps_Lock"
alias r="runpodctl"
