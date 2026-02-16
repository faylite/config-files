#!/usr/bin/env bash

# ------------------------------------------------------- #
#                  Setup homebrew                         #
# ------------------------------------------------------- #
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

# ------------------------------------------------------- #
#               Install applications                      #
# ------------------------------------------------------- #
packages="zsh vim nvim ctags curl docker stow ghostty"

if [ ! -z "$(command -v brew)" ]
then
	brew update

	brew install $packages

	brew install --cask iterm2
fi

source common.sh

printf "\neval \"$(/opt/homebrew/bin/brew shellenv)\"\n" >> ~/.profile
