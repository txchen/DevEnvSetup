#!/bin/bash
echo "configuring zsh"

# to re-init, manually delete ~/.zinit and reopen shell
echo -e "copying zshrc and p10k.zsh..."
cp -f zsh/zshrc ~/.zshrc
cp -f zsh/p10k.zsh ~/.p10k.zsh
echo "zsh config done"