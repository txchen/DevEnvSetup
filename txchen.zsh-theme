MD5="md5sum"
if [[ `uname` == 'Darwin' ]]; then MD5="md5" ; fi
# default to magenta
HOSTNAME_COLOR="5"
# get hash from hostname and generate number from 1 to 8
hash ${MD5} >/dev/null 2>&1 && HOSTNAME_COLOR=$(( 16#$(printf "%.12s" "$(hostname -s | $MD5)" ) % 8 + 1 ))

PROMPT=$'%(?..$(_exit_information)
)%F{blue}%~ $(_dotfiles_scm_info)%F{magenta}[%n@%F{$HOSTNAME_COLOR}%m%F{magenta}] %F{white}[%D %*]
%{$fg_bold[black]%}> %{$reset_color%}'

PROMPT2="%{$fg_blod[black]%}%_> %{$reset_color%}"

_exit_information()
{
  local stat="$?"
  if test $stat -ne 0 -a $stat -ne 128; then
    # if exited by signal, print the signal name
    if test $stat -gt 128; then
      local signal="$(builtin kill -l $[$stat - 128] 2>/dev/null)"
      test "$signal" && signal=" SIG$signal"
    fi
    echo "%{$fg[yellow]%}[Exit $stat$signal]%{$reset_color%}" || :
  fi
}

_dotfiles_scm_info()
{
  # find out if we're in a git or hg repo by looking for the control dir
  local d git hg
  d=$PWD
  while : ; do
    if test -d "$d/.git" ; then
      git=$d
      break
    elif test -d "$d/.hg" ; then
      hg=$d
      break
    fi
    test "$d" = / && break
    # portable "realpath" equivalent
    d=$(cd "$d/.." && echo "$PWD")
  done

  local br
  if test -n "$hg" ; then
    local file
    for file in "$hg/.hg/bookmarks.current" "$hg/.hg/branch" ; do
      test -f "$file" && { read br < "$file" ; break; }
    done
    br="hg::$br"
  elif test -n "$git" ; then
    if test -f "$git/.git/HEAD" ; then
      read br < "$git/.git/HEAD"
      case $br in
        ref:\ refs/heads/*) br=${br#ref: refs/heads/} ;;
        *) # Lop off all of an SHA1 except the leading 7 hex digits.
           # Use this cumbersome notation (it's portabile) rather
           # than ${head:0:7}, which doesn't work with older zsh.
          br="DETACHED @ ${br%?????????????????????????????????}" ;;
      esac
      br="git::$br"
    fi
  fi
  test -n "$br" && echo "%F{green}[$br] " || :
}
