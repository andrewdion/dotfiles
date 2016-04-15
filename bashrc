# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias less='less -S -#5 -X'
alias ls='ls --color=auto'
alias l='ls -l'
alias la='ls -la'

alias pq='pacman -Qs'
alias ps='pacman -Ss'
alias pU='sudo pacman -Syu'
alias pS='sudo pacman -S'
alias pR='sudo pacman -Rns'

alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias ga='git add'
alias gr='git reset HEAD'
alias gp='git pull'
alias gC='git commit'
alias gP='git push'

source ~/dotfiles/git-prompt.sh

export PS1='\[\e]2;\u@\H \w\a\e[37;1m\]\u@\H \w\e[0m\]$(__git_ps1)\n$ '
export LANG=en_US.UTF-8
export TERM=rxvt-unicode
export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER="google-chrome-stable"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
