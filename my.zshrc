# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="txchen"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
if [[ $('uname') == 'Darwin' ]]; then
    plugins=(git osx z vagrant brew golang)
elif  [[ $('uname') == 'Linux' ]]; then
    plugins=(git z ssh-agent golang)
fi

source $ZSH/oh-my-zsh.sh

# disable ctrl+s to stop the terminal, as vim might need this hotkey
stty -ixon

# set session history size
HISTSIZE=10000
# set saved history size
SAVEHIST=10000

# set color tab based on hostname
MD5="md5sum"
if [[ `uname` == 'Darwin' ]]; then MD5="md5" ; fi
hash ${MD5} >/dev/null 2>&1 && {
  HASH=`hostname -s | ${MD5}`
  echo -n -e "\033]6;1;bg;red;brightness;$((0x${HASH:0:2}))\a\033]6;1;bg;green;brightness;$((0x${HASH:2:2}))\a\033]6;1;bg;blue;brightness;$((0x${HASH:4:2}))\a"
}

# Customize to your needs...
export PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin
