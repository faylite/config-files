#!/usr/bin/env bash

# Author:faylite
# Shared setup script compatible with all platforms

# ------------------------------------------------------- #
#               Setup zsh and oh-my-zsh                   #
# ------------------------------------------------------- #
# If zsh is installed
if [ ! -z "$(command -v zsh)" ]
then
	# Setup oh-my-zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	mkdir -p ~/.oh-my-zsh/custom/themes
	ln -s ~/.config-files/apps/zsh/faylite.zsh-theme ~/.oh-my-zsh/custom/themes/faylite.zsh-theme

	# Setup zsh
	rm ~/.zshrc
	ln -s ~/.config-files/configs/zshrc ~/.zshrc
fi

# ------------------------------------------------------- #
#                      Vim                                #
# ------------------------------------------------------- #
if [ ! -z "$(command -v vim)" ]
then
	rm ~/.vimrc
	ln -s ~/.config-files/configs/vimrc ~/.vimrc
	# Install vundle
	if [ ! -d ~/.vim/bundle ]
	then
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi
	# Install vim themes
	ln -s ~/.config-files/vim/colors ~/.vim/colors
	# Create directories for the special vim files so they will be used by vim automatically
	mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo
	# Run vim command to install all the vundle plugins and exit
	vim +BundleInstall +qall

	# Install patched fonts for special statusbar characters use in themes
	git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
	/tmp/fonts/install.sh
	rm -rf /tmp/fonts
fi

# ------------------------------------------------------- #
#                      Tmux                               #
# ------------------------------------------------------- #
if [ ! -z "$(command -v tmux)" ]
then
	rm ~/.tmux.conf
	ln -s ~/.config-files/configs/tmux.conf ~/.tmux.conf
fi

# ------------------------------------------------------- #
#                      Weechat                            #
# ------------------------------------------------------- #
if [ ! -z "$(command -v weechat)" ]
then
	mkdir -p ~/.weechat/
	rm ~/.weechat/weechat.conf
	ln -s ~/.config-files/configs/weechat.conf ~/.weechat/weechat.conf
fi
