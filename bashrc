# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias tmux='tmux -2'
alias less='less -S -#5 -X'
alias ls='ls --color=auto'
alias l='ls -l'
alias la='ls -la'
alias activate='. .env/bin/activate'

alias pacq='pacman -Qs'
alias pacs='pacman -Ss'
alias pacU='sudo pacman -Syu'
alias pacS='sudo pacman -S'
alias pacR='sudo pacman -Rns'

cd() {
    builtin cd "$@" && ls -l
}

source /home/adion/dotfiles/git-prompt.sh
#source /home/adion/dotfiles/git-completion.sh

export PS1='\[\e]2;\u@\H \w\a\e[37;1m\]\u@\H \w\e[0m\]$(__git_ps1)\n$ '
export LANG=en_US.UTF-8
export TERM=rxvt-unicode
export VISUAL=vim
export EDITOR="$VISUAL"
export PAGER="less -X"
#export BROWSER="google-chrome-stable"
#export PATH="/home/adion/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/home/adion/java/jre1.8.0_144/bin:"
export PATH="/home/adion/bin:/usr/local/sbin:/usr/local/bin:/usr/bin"
export HISTTIMEFORMAT="[%y-%m-%d %T] "

# decrypting secrets only seems to work when this variable is unset
#export GPG_TTY=$(tty)

# {
# move these aliases to awscli virtual environment?
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
alias s3catalyst='s3cmd -c /home/adion/.s3cfg-catalyst'
alias s3eiaws='s3cmd -c /home/adion/.s3cfg-eiaws'
alias s3eicloud='s3cmd -c /home/adion/.s3cfg-eicloud'
alias s3fphs='s3cmd -c /home/adion/.s3cfg-fphs'
alias s3portal='s3cmd -c /home/adion/.s3cfg-portal'
alias s3shrine='s3cmd -c /home/adion/.s3cfg-shrine'
alias s3smartirb='s3cmd -c /home/adion/.s3cfg-smartirb'
# }

eval $(ssh-agent) 1> /dev/null

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
