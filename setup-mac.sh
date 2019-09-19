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

# ------------------------------------------------------- #
#               Setup zsh and oh-my-zsh                   #
# ------------------------------------------------------- #
# If zsh is installed
if [ ! -z "$(command -v zsh)" ]
then
	# Setup oh-my-zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	mkdir -p ~/.oh-my-zsh/custom/themes
	ln -s ~/.config-files/faylite.zsh-theme ~/.oh-my-zsh/custom/themes/faylite.zsh-theme

	# Setup zsh
	rm ~/.zshrc
	ln -s ~/.config-files/dotfiles/.zshrc ~/.zshrc
fi


# ------------------------------------------------------- #
#                      Bash                               #
# ------------------------------------------------------- #
# Create the local_env script if it doesn't exist, sourced by zsh for env variables that shouldn't be in version control
touch ~/.local_env.sh

# Bash
# Load aliases into bash
printf "\nsource ~/.config-files/aliases.sh\n" >> ~/.bash_profile

# ------------------------------------------------------- #
#                      Vim                                #
# ------------------------------------------------------- #
if [ ! -z "$(command -v vim)" ]
then
	rm ~/.vimrc
	ln -s ~/.config-files/dotfiles/.vimrc ~/.vimrc
	# Install vundle
	if [ ! -d ~/.vim/bundle ]
	then
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi
	ln -s ~/.config-files/vim/colors ~/.vim/colors
	# Create directories for the special vim files
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
	ln -s ~/.config-files/dotfiles/.tmux.conf ~/.tmux.conf
fi

# ------------------------------------------------------- #
#                      Weechat                            #
# ------------------------------------------------------- #
if [ ! -z "$(command -v weechat)" ]
then
	mkdir -p ~/.weechat/
	rm ~/.weechat/weechat.conf
	ln -s ~/.config-files/weechat.conf ~/.weechat/weechat.conf
fi
