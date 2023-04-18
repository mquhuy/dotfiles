alias ap="apropos"
alias eali="nvim $DOTFILES_DIR/sh_aliases.sh"
alias ebm="nvim ~/Computer-Sync/TxtLists/bookmarks.txt"
alias seali="source $RCFILE"
alias v="OPENAI_API_KEY=${OPENAI_API_KEY} nvim"
alias wiki="cd ~/Sync/wiki && nvim index.md"

# i3 config
alias i3config="nvim ~/.config/i3/config"
alias i3wsconf="nvim ~/.config/i3/ws.conf"
alias i3bc="nvim ~/.config/i3/i3blocks/primary.conf"
alias i3autoxrand="nvim ~/.config/i3/autoxrandr"

# Vim config
alias vinit="nvim ~/.config/nvim/init.lua"
alias vinitp="nvim ~/.config/nvim/plugins.vim"
alias vinitb="nvim ~/.config/nvim/basic.vim"
alias vinitc="nvim ~/.config/nvim/coc.vim"

# tmux config
alias tconf="nvim ~/.tmux.conf"

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
alias k="kubectl"
alias h="helm"
alias hdl="helm delete --purge"
alias h3="helm3"

# find
alias fin="find -name"

# Docker
alias d="docker"
alias drfi="docker run --rm -it"

#directory
mkdcd() { mkdir "$1"; cd "$1"; }

#shortcut
alias cdmgw="access_dir.sh ~/repos/mgw-branches"
alias cdmgwm="cd ~/repos/mgw-branches/master"
alias cdsbg="access_dir.sh ~/repos/sbg-branches"
alias cdsbgm="cd ~/repos/sbg-branches/master"
alias bb="ssh -t build-host zsh"
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
