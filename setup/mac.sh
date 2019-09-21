#!/usr/bin/env bash

# Setup script
# Author:faylite
# Sets up a mac machine to my preferred config

# ------------------------------------------------------- #
#                  Setup homebrew                         #
# ------------------------------------------------------- #
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# ------------------------------------------------------- #
#               Install applications                      #
# ------------------------------------------------------- #
packages="zsh vim tmux weechat ctags curl wget"

if [ ! -z "$(command -v brew)" ]
then
	brew update
	brew install $packages
fi

source ~/.config-files/setup/common.sh

# Setup aliases for bash
printf "\nsource ~/.config-files/scripts/aliases.sh\n" >> ~/.bash_profile
