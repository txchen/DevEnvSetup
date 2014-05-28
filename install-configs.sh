echo "### install configs ###"

echo "\ncopying zsh theme and zshrc..."
cp -f txchen.zsh-theme ~/.oh-my-zsh/themes/ || (echo "!! failed to cp txchen.zsh-them"; exit 2)
cp -f my.zshrc ~/.zshrc || (echo "!! failed to cp my.zshrc"; exit 2)
echo "done"

echo "\ncopying .tmux.conf..."
cp -f my.tmux.conf ~/.tmux.conf || (echo "!! failed to cp my.tmux.conf"; exit 2)
echo "done"

echo "\ncopying .gitconfig..."
cp -f my.gitconfig ~/.gitconfig || (echo "!! failed to cp gitconfig"; exit 2)
echo "done"

echo "\ncopying .gitignore_global..."
cp -f my.gitignore_global ~/.gitignore_global || (echo "!! failed to cp gitignore_global"; exit 2)
echo "done"

echo "\ncopying .vimrc..."
cp -f vimrc ~/.vimrc || (echo "!! failed to cp vimrc"; exit 2)
echo "done"

echo "\ninstalling vundle and vim plugins..."
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo "  vundle repo not cloned yet, clone it."
  hash git >/dev/null 2>&1 || (echo "!! git not installed, cannot clone vundle repo"; exit 2)
  /usr/bin/env git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim || {
    echo "!! git clone vundle failed"
    exit 2
  }
fi
hash vim >/dev/null 2>&1 || (echo "!! vim not installed! failed.."; exit 2)
echo "  running vim to install plugins"
vim +PluginInstall +qall || (echo "!! failed to run vim plugin install.."; exit 2)
echo "done"

echo "\n### install completed :) ###"
