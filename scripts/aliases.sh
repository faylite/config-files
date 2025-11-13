# Navigation
alias l="ls -lah"
alias ll="ls -lh"
alias ..="cd .."
alias ...="cd ../.."

# Git
alias g="git"
alias s="git status"
alias gl="git log --graph --oneline --decorate --abbrev-commit --all"
alias glt="git log --graph --oneline --decorate --abbrev-commit"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# Vim
alias vi="vim"
alias vt="vim -t "
alias config-edit-vim="vim ~/.vimrc"
alias config-edit-bash="vim ~/.bashrc"
alias config-edit-zsh='vim ~/.zshrc'
alias config-edit-tmux='vim ~/.tmux.conf'
alias config-edit-local=='vim ~/.local_env.sh'
alias config-edit-alias='vim ~/.config-files/.zsh-aliases.zsh'

# Dev tools
alias art='php artisan'

alias t='tmux'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'
