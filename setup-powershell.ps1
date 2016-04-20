# Setup script
# Author:faylite
# Sets up powershell on a windows machine to my preferred config

# Setup config directory
mkdir ~/.psconf

# Setup aliases
# TODO: Add aliases

# VIM
rm ~/.vimrc
cp ~/.config-files/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/vimfiles/colors
cp ~/.config-files/vim/colors/jellybeans.vim ~/vimfiles/colors/.
vim -c PluginInstall
