# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias l="ls -lah"
alias ll="ls -lh"
alias lld="ls -lhd .*"

# Git
alias g="git"
alias s="git status"
alias ga="git add"
alias gc="git commit"
alias gl="git log --graph --oneline --decorate --abbrev-commit --all"
alias glt="git log --graph --oneline --decorate --abbrev-commit"
alias gll="git log --all --pretty=format:'%C(blue)%h %C(blue)%<(18)%cN %C(yellow)%ai %Creset%s'"
alias gls="git log --all --pretty=format:'%C(blue)%h %C(blue)%<(18)%cN %C(yellow)%as %Creset%s'"

alias git-stale-list='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}"'
alias git-stale-prune='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -d'

# Vim
alias vi="nvim"
alias vim="nvim"

alias config-edit-nvim="nvim ~/.config/nvim/init.lua"
alias config-edit-vim="nvim ~/.vimrc"
alias config-edit-bash="nvim ~/.bashrc"
alias config-edit-zsh='nvim ~/.zshrc'
alias config-edit-tmux='nvim ~/.tmux.conf'
alias config-edit-alias='nvim ~/.aliasrc'

# Dev tools
alias art='php artisan'
alias sail='[ -f sail ] && bash sail || bash ./vendor/bin/sail'
alias sugoi="./vendor/bin/sugoi"

# alias t='tmux'
# alias ta='tmux attach -t'
# alias tnew='tmux new -s'
# alias tls='tmux ls'
# alias tkill='tmux kill-session -t'
