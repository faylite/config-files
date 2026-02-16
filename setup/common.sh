#!/usr/bin/env bash

# ------------------------------------------------------- #
#                    Oh my zsh                            #
# ------------------------------------------------------- #

if [ ! -z "$(command -v vim)" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ------------------------------------------------------- #
#                      Vim                                #
# ------------------------------------------------------- #
if [ ! -z "$(command -v vim)" ]; then
	# Install vundle
	if [ ! -d ~/.vim/bundle ]; then
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
