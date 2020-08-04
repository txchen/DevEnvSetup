#!/bin/bash

if [[ $(uname) == 'Darwin' ]]; then
  echo -e "\ncopying phoenix config..."
  cp -f mac/phoenix.js ~/.phoenix.js || { echo "!! failed to cp phoenix.js"; exit 2; }
  echo "done"

  echo -e "\ncopying karabiner config..."
  cp -f mac/karabiner.json ~/.config/karabiner/karabiner.json || { echo "!! failed to cp karabiner.json"; exit 2; }
  echo "mac config done"
fi
