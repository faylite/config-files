# Tmux
alias t='tmux'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# Git
alias ga='git add'
alias gc='git commit'
alias gp='git push origin'
alias s='git status'

# Edit config file shortcuts
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'
alias ep='vim ~/.local_env.sh'

# Commonly used programs
alias v='vim'

# General
alias c='clear'
# Command = double clicking file
alias o='xdg-open'
# Exit terminal, vim keybind because of frequent typos xD
alias :q='exit'

# Volume control
alias vol='amixer -D pulse sset Master '
alias volup='amixer -D pulse sset Master 5%+'
alias voldown='amixer -D pulse sset Master 5%-'

# PHP dev tools
# Artisan shortcut
alias artisan='php artisan'
