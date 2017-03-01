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

aws_access() {
    usage="usage: aws_access ACCOUNT\n\nACCOUNT can be one of the following: catalyst portal smartirb shrine eagle-i-aws eagle-i-cloud fphs\n"
    if [ "$#" -ne 1 ]; then
        echo -e $usage
        return 1
    fi
    case $1 in
        catalyst )
            id=
            key=
            ;;
        portal )
            id=
            key=
            ;;
        smartirb )
            id=
            key=
            ;;
        shrine )
            id=
            key=
            ;;
        eagle-i-aws )
            id=
            key=
            ;;
        eagle-i-cloud )
            id=
            key=
            ;;
        fphs )
            id=
            key=
            ;;
        * )
            echo -e "Unknown account.\n\n$usage"
            return 1
            ;;
    esac
    export AWS_ACCESS_KEY_ID=$id
    export AWS_SECRET_ACCESS_KEY=$key
}

eval $(ssh-agent) 1> /dev/null

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
