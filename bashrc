# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias less='less -S -#5'
alias ls='ls --color=auto'
alias l='ls -la'
alias ..='cd ..'
alias vimprobable2='tabbed vimprobable2 -e &> /dev/null &'
alias chromium='chromium &> /dev/null &'
alias vol='alsamixer'
export PS1='\[\e]2;\u@\H \w\a\e[37;1m\]\u@\H \w\n \[\e[0m\]$ '

export LANG=en_US.UTF-8
export TERM=rxvt-unicode
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$PATH:$HOME/bin"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
