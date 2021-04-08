# Navigation
alias l="ls -lah"
alias ll="ls -lh"
alias c="clear"
alias cls="clear"
alias ..="cd .."
alias ...="cd ../.."
alias :q="exit"

# Git
alias g="git"
alias s="git status"
alias gl="git log --graph --oneline --decorate --abbrev-commit --all"
alias glt="git log --graph --oneline --decorate --abbrev-commit"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gfm="git merge --no-ff"
alias gm="git merge"

# Vim
alias v="vim"
alias vi="vim"
alias vt="vim -t "
alias ev="vim ~/.vimrc"
alias eb="vim ~/.bashrc"
alias ez='vim ~/.zshrc'
alias et='vim ~/.tmux.conf'
alias ep='vim ~/.local_env.sh'
alias ea='vim ~/.config-files/.zsh-aliases.zsh'

# Vagrant boxes
alias box-init-apache-ubuntu14.04='cp ~/.config-files/apps/vagrant/ubuntu-lamp/14.04/* .'
alias box-init-apache-ubuntu16.04='cp ~/.config-files/apps/vagrant/ubuntu-lamp/16.04/* .'
alias box-init-laravel='cp ~/.config-files/apps/vagrant/laravel/* .'

# Dev tools
alias art='php artisan'

alias t='tmux'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'
