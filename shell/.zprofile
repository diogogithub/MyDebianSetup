#!/usr/bin/zsh

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export GOPATH="$HOME/go"
export GPG_TTY=$(tty)
export LESS='-F -g -i -M -R -S -w -X -z-4'

typeset -gU cdpath fpath mailpath path
path+=("$HOME/.dotfiles/bin" "$GOPATH/bin" "$HOME/.local/bin")

# It looks like this is a login shell, load .profile
[ -f "$HOME/.profile" ] && source "$HOME/.profile"

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]
then
  exec startx > ${HOME}/.xoutput 2>&1
fi
