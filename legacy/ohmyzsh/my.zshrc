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
alias gt='git tree'
alias pw='pwsh -c'

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
    plugins=(git osx z brew colored-man-pages)
elif  [[ $('uname') == 'Linux' ]]; then
    plugins=(git z ssh-agent colored-man-pages)
fi

function curlperf {
  curl -o /dev/null -s -w "time_namelookup=%{time_namelookup}\ntime_connect=%{time_connect}\ntime_appconnect=%{time_appconnect}\ntime_total=%{time_total}\n" "$1"
}

source $ZSH/oh-my-zsh.sh

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

function setup_fzf() {
  hash fzf >/dev/null 2>&1 || return 1
  if [[ $(uname) == 'Linux' ]]; then
    # only works for deb package
    [[ $- == *i* ]] && source "/usr/share/zsh/vendor-completions/_fzf" 2> /dev/null
    source "/usr/share/doc/fzf/examples/plugin/key-bindings.zsh"
  fi
  if [[ $(uname) == 'Darwin' ]]; then
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
    source "/usr/local/opt/fzf/shell/key-bindings.zsh"
  fi
  hash fd >/dev/null 2>&1 || return 1
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
}
setup_fzf
