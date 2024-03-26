# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias less='less -S -#5 -X -i -R'
alias cl='clear'
alias ls='ls --color=auto'
alias l='ls -l'
alias la='ls -la'
alias vol='alsamixer'
alias tmux='tmux -2 a -dt'

alias pacq='pacman -Qs'
alias pacs='pacman -Ss'
alias pacU='sudo pacman -Syu'
alias pacS='sudo pacman -S'
alias pacR='sudo pacman -Rns'

cd() {
    builtin cd "$@" && ls -l
}

source /home/adion/dotfiles/git-prompt.sh

export PS1='\[\e]2;\u@\H \w\a\e[37;1m\]\u@\H \w\e[0m\]$(__git_ps1)\n$ '
export LANG=en_US.UTF-8
export TERM=rxvt-unicode
export VISUAL=vim
export EDITOR="$VISUAL"
export PAGER="less -S -#5 -X -i -R"
#export BROWSER="google-chrome-stable"
#export PATH="/home/adion/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/home/adion/java/jre1.8.0_144/bin:"
export PATH="/home/adion/bin:/usr/local/sbin:/usr/local/bin:/usr/bin"
#export PATH="/home/adion/.rbenv/bin:/home/adion/bin:/usr/local/sbin:/usr/local/bin:/usr/bin"
export HISTTIMEFORMAT="[%y-%m-%d %T] "

# decrypting secrets only seems to work when this variable is unset
#export GPG_TTY=$(tty)

# {
# ideally move these aliases to awscli virtual environment
aws-profile() {
    usage="usage: aws-profile ACCOUNT\n\nwhere ACCOUNT can be one of the following:\ncatalyst eiaws eicloud fphs portal shrine shrinedev"
    if [ "$#" -ne 1 ]; then
        echo -e "$usage\n"
        echo "AWS_PROFILE=$AWS_PROFILE"
        return 1
    fi

    case $1 in
      catalyst )
        export AWS_PROFILE=harvard-catalyst;;
      eiaws )
        export AWS_PROFILE=eagle-i-aws;;
      eicloud )
        export AWS_PROFILE=eagle-i-cloud;;
      fphs )
        export AWS_PROFILE=fphs;;
      masscpr )
        export AWS_PROFILE=harvard-catalyst-masscpr;;
      portal )
        export AWS_PROFILE=harvard-catalyst-portal;;
      shrine )
        export AWS_PROFILE=harvard-catalyst-shrine;;
      shrinedev )
        export AWS_PROFILE=harvard-catalyst-shrine-dev;;
    esac
      
    echo "AWS_PROFILE=$AWS_PROFILE"

    #export AWS_DEFAULT_REGION=us-east-1
    #export AWS_DEFAULT_OUTPUT=json
}
alias s3catalyst='s3cmd -c /home/adion/.aws/s3cfg-catalyst'
alias s3eiaws='s3cmd -c /home/adion/.aws/s3cfg-eiaws'
alias s3eicloud='s3cmd -c /home/adion/.aws/s3cfg-eicloud'
alias s3fphs='s3cmd -c /home/adion/.aws/s3cfg-fphs'
alias s3portal='s3cmd -c /home/adion/.aws/s3cfg-portal'
alias s3shrine='s3cmd -c /home/adion/.aws/s3cfg-shrine'
alias s3smartirb='s3cmd -c /home/adion/.aws/s3cfg-smartirb'
# }

eval $(ssh-agent) 1> /dev/null

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
