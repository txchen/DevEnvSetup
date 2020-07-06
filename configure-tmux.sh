#!/bin/bash

echo -e "\ncopying .tmux.conf..."
cp -f tmux/my.tmux.conf ~/.tmux.conf || { echo "!! failed to cp my.tmux.conf"; exit 2; }
echo "copy done"

echo -e "\ninstalling tmux resurrect"
TMUXRESURRECTDIR=~/.tmux-resurrect/
if [ -d "$TMUXRESURRECTDIR" ]; then
  rm -rf $TMUXRESURRECTDIR
fi
git clone https://github.com/tmux-plugins/tmux-resurrect.git $TMUXRESURRECTDIR || {
  echo "!! failed to setup tmux resurrect"
  exit 2
}
echo "install done"