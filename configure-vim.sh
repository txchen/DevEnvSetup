#!/bin/bash
echo "configuring vim/nvim"

echo -e "\ncopy vimrc..."
cp -f vim/vimrc ~/.vimrc || { echo "!! failed to cp vimrc"; exit 2; }
echo "copy vimrc done"

echo -e "\nconfigure nvim with nvchad..."
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
mkdir -p ~/.config/nvim/lua/custom/
cp -r -f nvchad/custom ~/.config/nvim/lua/
echo "nvim config done"

echo "vim/nvim config done"
