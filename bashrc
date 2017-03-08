# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias less='less -S -#5 -X'
alias ls='ls --color=auto'
alias l='ls -l'
alias la='ls -la'

alias pacq='pacman -Qs'
alias pacs='pacman -Ss'
alias pacU='sudo pacman -Syu'
alias pacS='sudo pacman -S'
alias pacR='sudo pacman -Rns'

cd() {
    builtin cd "$@" && ls -l
}

source ~/dotfiles/git-prompt.sh

export PS1='\[\e]2;\u@\H \w\a\e[37;1m\]\u@\H \w\e[0m\]$(__git_ps1)\n$ '
export LANG=en_US.UTF-8
export TERM=rxvt-unicode
export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER="google-chrome-stable"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/home/adion/bin:"

export ANSIBLE_VAULT_PASSWORD_FILE=/home/adion/stash/iteam/secrets/vault.txt

aws-profile() {
    usage="usage: aws-profile ACCOUNT\n\nwhere ACCOUNT can be one of the following:\ncatalyst portal smartirb shrine eiaws eicloud fphs"
    if [ "$#" -ne 1 ]; then
        echo -e "$usage\n"
        echo "AWS_DEFAULT_PROFILE=$AWS_DEFAULT_PROFILE"
        return 1
    fi
    export AWS_DEFAULT_PROFILE=$1
    echo "AWS_DEFAULT_PROFILE=$1"
}

eval $(ssh-agent) 1> /dev/null

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
