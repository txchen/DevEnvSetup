# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="txchen"

# Example aliases
# find files with colored output
alias f='find . | grep --color'
alias nr='npm run'
alias dn='dotnet'
alias d-c='docker-compose'

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
    plugins=(git osx z ssh-agent brew golang colored-man)
elif  [[ $('uname') == 'Linux' ]]; then
    plugins=(git z ssh-agent golang colored-man)
fi

function curlperf {
  curl -o /dev/null -s -w "time_namelookup=%{time_namelookup}\ntime_connect=%{time_connect}\ntime_appconnect=%{time_appconnect}\ntime_total=%{time_total}\n" "$1"
}

function wiki {
  if [[ -z $1 ]]; then
    open -a Safari "https://github.com/txchen/wiki"
  else
    open -a Safari "https://github.com/txchen/wiki/search?q=$*"
  fi
}

source $ZSH/oh-my-zsh.sh
alias gb=$GOPATH/bin/gb

# disable ctrl+s to stop the terminal, as vim might need this hotkey
stty -ixon

# set session history size
HISTSIZE=10000
# set saved history size
SAVEHIST=10000

# zsh+tmux might introduce dup PATH, dedup it
typeset -aU path
# make ctrl+u same as bash. To delete entire line, use ctrl+c
bindkey \^U backward-kill-line
