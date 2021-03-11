#!/usr/bin/env bash

# Setup script
# Author:faylite
# Sets up a mac machine to my preferred config

# ------------------------------------------------------- #
#                  Setup homebrew                         #
# ------------------------------------------------------- #
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

touch ~/.local_env.sh
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.local_env.sh

eval "$(/opt/homebrew/bin/brew shellenv)"

# ------------------------------------------------------- #
#               Install applications                      #
# ------------------------------------------------------- #
packages="zsh vim tmux weechat ctags curl wget docker"

if [ ! -z "$(command -v brew)" ]
then
	brew update

	brew install $packages

	brew install --cask docker
	brew install --cask iterm2
fi

source ~/.config-files/setup/common.sh

# Setup aliases for bash
printf "\nsource ~/.config-files/scripts/aliases.sh\n" >> ~/.bash_profile
printf "\nsource ~/.local_env.sh\n" >> ~/.bash_profile
