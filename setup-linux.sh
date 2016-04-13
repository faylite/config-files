# Setup script
# Author:faylite
# Sets up a linux machine to my preferred config

# Install applications
sudo apt-get install -y zsh vim tmux weechat

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir ~/.oh-my-zsh/custom/themes
ln -s ~/.config-files/faylite.zsh-theme ~/.oh-my-zsh/custom/themes/faylite.zsh-theme

# Create the local_env script if it doesn't exist, sourced by zsh for env variables that shouldn't be in version control
touch ~/.local_env.sh

# ZSH
rm ~/.zshrc
ln -s ~/.config-files/.zshrc ~/.zshrc

# VIM
rm ~/.vimrc
ln -s ~/.config-files/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.config-files/vim/colors/jellybeans.vim ~/.vim/colors/.
vim -c PluginInstall

# Tmux
rm ~/.tmux.conf
ln -s ~/.config-files/.tmux.conf ~/.tmux.conf

# Weechat
rm ~/.weechat/weechat.conf
ln -s ~/.config-files/weechat.conf ~/.weechat/weechat.conf

# GNU debugger
rm ~/.gdbinit
ln -s ~/.config-files/.gdbinit ~/.gdbinit

