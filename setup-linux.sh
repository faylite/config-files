# Setup script
# Author:faylite
# Sets up a linux machine to my preferred config

# ------------------------------------------------------- #
#               Install applications                      #
# ------------------------------------------------------- #
$packages = "zsh vim tmux weechat exuberant-ctags curl"

# ------------------------------------------------------- #
#                     apt-get                             #
# ------------------------------------------------------- #
if [ -z "$(command -v yum)" ]
then
	sudo yum check-update
	sudo yum -y install $packages
fi

# ------------------------------------------------------- #
#                     yum                                 #
# ------------------------------------------------------- #
if [ -z "$(command -v apt-get)" ]
then
	sudo apt-get update
	sudo apt-get install -y $packages
fi

# ------------------------------------------------------- #
#               Setup zsh and oh-my-zsh                   #
# ------------------------------------------------------- #
# If zsh is installed
if [ -z "$(command -v zsh)" ]
then
	# Setup zsh
	rm ~/.zshrc
	ln -s ~/.config-files/dotfiles/.zshrc ~/.zshrc
		
	# Setup oh-my-zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	mkdir ~/.oh-my-zsh/custom/themes
	ln -s ~/.config-files/faylite.zsh-theme ~/.oh-my-zsh/custom/themes/faylite.zsh-theme
fi


# ------------------------------------------------------- #
#                      Bash                               #
# ------------------------------------------------------- #
# Create the local_env script if it doesn't exist, sourced by zsh for env variables that shouldn't be in version control
touch ~/.local_env.sh

# Bash
# Load aliases into bash
echo source ~/.config-files/.bash-aliases.sh >> ~/.bashrc

# ------------------------------------------------------- #
#                      Vim                                #
# ------------------------------------------------------- #
if [ -z "$(command -v vim)" ]
then
	rm ~/.vimrc
	ln -s ~/.config-files/dotfiles/.vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s ~/.config-files/vim/colors ~/.vim/colors
	# Run vim command and exit
	vim +BundleInstall +qall
fi

# ------------------------------------------------------- #
#                      Tmux                               #
# ------------------------------------------------------- #
if [ -z "$(command -v tmux)" ]
then
	rm ~/.tmux.conf
	ln -s ~/.config-files/dotfiles/.tmux.conf ~/.tmux.conf
fi

# ------------------------------------------------------- #
#                      Weechat                            #
# ------------------------------------------------------- #
if [ -z "$(command -v weechat)" ]
then
	rm ~/.weechat/weechat.conf
	ln -s ~/.config-files/weechat.conf ~/.weechat/weechat.conf
fi

# ------------------------------------------------------- #
#                   GNU Debugger                          #
# ------------------------------------------------------- #
if [ -z "$(command -v gdb)" ]
then
	rm ~/.gdbinit
	ln -s ~/.config-files/dotfiles/.gdbinit ~/.gdbinit
fi
