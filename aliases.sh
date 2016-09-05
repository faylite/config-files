# Navigation
alias l="ls -la"
alias ll="ls -l"
alias c="clear"
alias cls="clear"
alias ..="cd .."
alias ...="cd ../.."
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
alias ev="vim ~/.vimrc"
alias eb="vim ~/.bashrc"
alias ez='vim ~/.zshrc'
alias ep='vim ~/.local_env.sh'
alias ea='vim ~/.config-files/.zsh-aliases.zsh'

# Vagrant boxes
alias box-init-apache-ubuntu14.04='cp ~/.config-files/vagrant/ubuntu-lamp/14.04/* .'
alias box-init-apache-ubuntu16.04='cp ~/.config-files/vagrant/ubuntu-lamp/16.04/* .'
alias box-init-laravel='cp ~/.config-files/vagrant/laravel/* .'

# Dev tools
alias art='php artisan'

# Linux specific
if [[ !( -z "$(command -v yum)" ) || ( -z "$(command -v apt-get)" ) ]]
then
	# Dev Tools
	# GDB quiet startup
	alias gdb='gdb -q'

	# Command = double clicking file
	alias o='xdg-open'

	# Volume control
	alias vol='amixer -D pulse sset Master '
	alias volup='amixer -D pulse sset Master 5%+'
	alias voldown='amixer -D pulse sset Master 5%-'
fi

# Tmux
if [[ !( -z "$(command -v tmux)" ) ]]
then
	alias t='tmux'
	alias ta='tmux attach -t'
	alias tnew='tmux new -s'
	alias tls='tmux ls'
	alias tkill='tmux kill-session -t'
	alias et='vim ~/.tmux.conf'
fi

# Load all functions from the bash script directory
for f in ~/.config-files/scripts/bash/*; do source $f; done
