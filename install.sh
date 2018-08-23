#!/bin/bash
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors

# Get the global configuration for vim
echo "> Installing init.vim"
wget -q -O ~/.config/nvim/init.vim https://raw.githubusercontent.com/kadro/vim-install/master/init.vim

# Get color schema
echo "> Installing colorscheme"
wget -q -O ~/.config/nvim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

# Install Vundle.vim
if [ -d ~/.config/nvim/bundle/Vundle.vim ]; then
  echo "> Vundle.vim already installed"
else
  echo "> Installing Vundle.vim"
  git clone -q https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
fi

# Download plugins
echo "> Installing Vim Plugins"
vim +PluginInstall +qall

echo "Done!"
