# Navigation
alias l="ls -l"
alias ll="ls -la"
alias c="clear"
alias ..="cd .."
alias :q="exit"

# Git
alias g="git"
alias s="git status"
alias gl="git log --graph --oneline --decorate --abbrev-commit --all"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# Vim
alias v="vim"
alias vi="vim"
alias eb="vim ~/.bashrc"
alias ev="vim ~/.vimrc"

# Load all functions from the bash script directory
for f in ~/.config-files/scripts/bash/*; do source $f; done
