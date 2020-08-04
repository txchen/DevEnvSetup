#!/bin/bash
echo "configuring vim/nvim"

echo -e "\ncopy vimrc..."
cp -f vim/vimrc ~/.vimrc || { echo "!! failed to cp vimrc"; exit 2; }
echo "copy vimrc done"

echo -e "\ncopy init.vim for neovim..."
mkdir -p ~/.config/nvim
cp -f nvim/init.vim ~/.config/nvim/init.vim || { echo "!! failed to cp init.vim"; exit 2; }
echo "copy init.vim done"

echo "vim config done"