# Setup script
# Author:faylite
# Sets up a windows machine to my preferred config

# Create the local_env script if it doesn't exist, sourced by zsh for env variables that shouldn't be in version control
touch ~/.local_env.sh

# Setup aliases
echo source ~/.config-files/aliases.sh >> ~/.bashrc

# VIM
rm ~/.vimrc
ln -s ~/.config-files/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/colors/
cp ~/.config-files/vim/colors/jellybeans.vim ~/.vim/colors/.
vim -c PluginInstall
