#!/usr/bin/env bash

# ------------------------------------------------------- #
#               Install applications                      #
# ------------------------------------------------------- #
packages="zsh stow vim tmux exuberant-ctags curl i3 i3blocks i3lock i3status dmenu"

# ------------------------------------------------------- #
#             pact (babun windows Cygwin)                 #
# ------------------------------------------------------- #
if [ ! -z "$(command -v pact)" ]
then
	pact install $packages
fi

# ------------------------------------------------------- #
#                     apt-get                             #
# ------------------------------------------------------- #
if [ ! -z "$(command -v yum)" ]
then
	sudo yum check-update
	sudo yum -y install $packages
fi

# ------------------------------------------------------- #
#                        yum                              #
# ------------------------------------------------------- #
if [ ! -z "$(command -v apt-get)" ]
then
	sudo apt-get update
	sudo apt-get install -y $packages
fi

# ------------------------------------------------------- #
#                       pacman                            #
# ------------------------------------------------------- #
if [ ! -z "$(command -v pacman)" ]
then
	sudo pacman -S $packages
fi

source common.sh
