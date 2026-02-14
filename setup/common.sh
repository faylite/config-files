#!/usr/bin/env bash

# ------------------------------------------------------- #
#               Setup zsh and oh-my-zsh                   #
# ------------------------------------------------------- #
# If zsh is installed
if [ ! -z "$(command -v zsh)" ]
then
	# Setup oh-my-zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# ------------------------------------------------------- #
#                      Vim                                #
# ------------------------------------------------------- #
if [ ! -z "$(command -v vim)" ]
then
	# Install vundle
	if [ ! -d ~/.vim/bundle ]
	then
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi

	# Create directories for the special vim files so they will be used by vim automatically
	mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo

	# Run vim command to install all the vundle plugins and exit
	vim +BundleInstall +qall

	# Install patched fonts for special statusbar characters use in themes
	git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
	/tmp/fonts/install.sh
	rm -rf /tmp/fonts
fi
