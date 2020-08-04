#!/bin/bash
echo "configuring git"

hash git >/dev/null 2>&1 || { echo "!! git not installed, cannot continue"; exit 2; }

if [ -f ~/.gitconfig ] ; then
  echo "$HOME/.gitconfig already exists, get the existing username and email first"
  git_username=$(git config --global user.name)
  git_useremail=$(git config --global user.email)
  echo "user = $git_username"
  echo "email = $git_useremail"
fi

echo -e "\ncopying .gitconfig..."
cp -f git/my.gitconfig ~/.gitconfig || { echo "!! failed to cp gitconfig"; exit 2; }
echo "done"
# set back old value for user.name user.email
if [ ${git_username:+x} ] ; then
  echo "set back git username to $git_username"
  git config --global user.name "$git_username"
fi
if [ ${git_useremail:+x} ] ; then
  echo "set back git email to $git_useremail"
  git config --global user.email "$git_useremail"
fi

gitversion=$(git version)
gitv180="git version 1.8.0"
winner=$(echo -e "$gitversion\n$gitv180" | sed '/^$/d' | sort -nr | head -1)
if [[ "$winner" == "$gitv180" ]] ; then
  # push.default simple is only valid since 1.8.0
  echo "set push.default to upstream, since simple is not available"
  git config --global push.default upstream
fi

# set git credential.helper
if [[ $(uname) == 'Linux' ]]; then
  git config --global credential.helper cache
  git config --global credential.helper "cache --timeout=604800"
fi
if [[ $(uname) == 'Darwin' ]]; then
  git config --global credential.helper osxkeychain
fi

echo -e "\ncopying .gitignore_global..."
cp -f git/my.gitignore_global ~/.gitignore_global || { echo "!! failed to cp gitignore_global"; exit 2; }
echo "git config done"
