# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="faylite"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# -------- Plugins ---------------------
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# git 			- Git completion
# z 			- directory jumper, builds an database and jumps to the dir you most likely wanted to go to
# nmap			- nmap completion
# sudo			- Press <ESC> twice to add sudo before command, or previous command if line is empty
# vagrant		- Vagrant completion
# composer		- PHP Composer completion
# laravel5		- Laravel5 auto-completion and aliases
# web-search 	- Web search, google TEXT, bing TEXT, ddg TEXT
# nyan		 	- nyan nyan nyan nyan nyan nyan
# catimg		- Prints an image of a cat
# rand-quote 	- random quote

plugins=(git git-flow z nmap sudo vagrant gradle gitignore web-search composer laravel5 nyan catimg rand-quote lol)

# --------------------------------------

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

if [ -d "$HOME/bin" ]
then
	export PATH="$HOME/bin:$PATH"
fi

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

#
# --------------- Custom Stuff ---------------
#

# Switch to bash like glob error handling, zsh throws an error when globbing fails, bash returns the unmodified glob
setopt NO_NOMATCH

# Set terminal to one with 256color support
export TERM="screen-256color"

# Enable spell checker
setopt CORRECT

# Set vim as default editor
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Add extra aliases
source ~/.config-files/aliases.sh

# Create custom env setup file if it doesn't exist
touch ~/.local_env.sh
# source custom PATH for this system
source ~/.local_env.sh
