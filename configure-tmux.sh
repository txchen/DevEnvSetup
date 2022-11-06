#!/bin/bash
echo "configuring tmux"

echo -e "\ncopying .tmux.conf..."
cp -f tmux/my.tmux.conf ~/.tmux.conf || { echo "!! failed to cp my.tmux.conf"; exit 2; }
echo "copy done"

# install tmux plugin manager
TPMDIR=~/.tmux/plugins/tpm
if [ -d "$TPMDIR" ]; then
  rm -rf $TPMDIR
fi
git clone https://github.com/tmux-plugins/tpm $TPMDIR

echo "tmux config done. Use 'C-b I' to install tpm plugins"