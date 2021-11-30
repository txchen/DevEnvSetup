#!/bin/bash
echo "configuring zsh"

# to upgrade, zimfw update; zimfw upgrade
echo -e "copying zshrc and zimrc..."
cp -f zsh/zshrc ~/.zshrc
rm -rf ~/.zim
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh || true
cp -f zsh/zimrc ~/.zimrc
echo "zsh config done"

echo "installing fzf..."
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install
echo "fzf install done"
