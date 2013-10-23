echo "copying config files..."
cp -f txchen.zsh-theme ~/.oh-my-zsh/themes/ || (echo "failed to cp txchen.zsh-them"; exit 2)
cp -f my.zshrc ~/.zshrc || (echo "failed to cp my.zshrc"; exit 2)

cp -f my.tmux.conf ~/.tmux.conf || (echo "failed to cp my.tmux.conf"; exit 2)

echo "config files are copied :)"