#!/usr/bin/env bash

xcode-select --install

# ------------------------------------------------------- #
#                  Setup homebrew                         #
# ------------------------------------------------------- #
if [ -z "$(command -v brew)" ] # Install when missing
then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ------------------------------------------------------- #
#               Install applications                      #
# ------------------------------------------------------- #
brew update

# Basic terminal tooling
brew install zsh bash stow tmux fzf \
	curl wget sops age \
	gnu-sed gawk coreutils \
	yq jq \
	htop watch tcpdump nmap

# Applications
brew install ghostty

brew install --cask font-jetbrains-mono-nerd-font

# Ops
brew install docker gh opentofu \
	gh doctl awscli \
	kubectl k9s helm kustomize

# Programming
brew install \
	lua luarocks stylua \
	rust \
	julia \
	v \
	node \
	python \
	cmake ninja

# Neovim
brew install vim nvim \
	ripgrep universal-ctags fd \
	tree-sitter-cli

source common.sh

printf "\neval \"$(/opt/homebrew/bin/brew shellenv)\"\n" >> ~/.profile
