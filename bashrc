# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias less='less -S -#5 -X'
alias ls='ls --color=auto'
alias l='ls -l'
alias la='ls -la'

alias pq='pacman -Qs'
alias ps='pacman -Ss'
alias pS='sudo pacman -S'
alias pR='sudo pacman -Rns'

alias gs='git status'
alias gb='git branch'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gu='git pull'

export PS1='\[\e]2;\u@\H \w\a\e[37;1m\]\u@\H \w\n \[\e[0m\]$ '
export LANG=en_US.UTF-8
export TERM=rxvt-unicode
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$PATH:$HOME/bin"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
