# Setup script
# Author:faylite
# Sets up a linux machine to my preferred config

# ------------------------------------------------------- #
#               Install applications                      #
# ------------------------------------------------------- #
packages="zsh vim tmux weechat exuberant-ctags curl git-flow i3 i3blocks i3lock i3status dmenu"

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

# ------------------------------------------------------- #
#                   GNU Debugger                          #
# ------------------------------------------------------- #
if [ ! -z "$(command -v gdb)" ]
then
	rm ~/.gdbinit
	ln -s ~/.config-files/configs/gdbinit ~/.gdbinit
fi

# ------------------------------------------------------- #
#                   i3 Window Manager                     #
# ------------------------------------------------------- #
if [ ! -z "$(command -v i3)" ]
then
	rm ~/.config/i3/config
	ln -s ~/.config-files/configs/i3.config ~/.config/i3/config
fi

source ~/.config-files/setup/common.sh

# Add various bash aliases to bash
printf "\nsource ~/.config-files/aliases.sh\n" >> ~/.bashrc
