#!/bin/bash

echo -e "\ncopy vimrc..."
cp -f vim/vimrc ~/.vimrc || { echo "!! failed to cp vimrc"; exit 2; }
echo "done"