#!/bin/bash
set -ex

./configure-git.sh
./configure-zsh.sh
./configure-vim.sh
./configure-macos.sh
./configure-tmux.sh

echo -e "\n### all done :) ###"
