# .bash_profile

export EDITOR='subl -w'

alias ..='cd ..'
alias ls='ls -al'

root='/Users/ssawchukii/dev/'
function cur_dir {
    local dir=$1
    echo ${dir/$root/}
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias gam='git commit -am'
alias grm='git rm'
alias gmv='git mv'
alias grr='git reset --hard HEAD'
alias  ga='git add'
alias  gp='git push'
alias  gl='git log'
alias  gs='git status -s'
alias  gf='git fetch -p'
alias  gm='git commit -m'
alias  gb='git branch'
alias  gc='git checkout'

function proml {
    local  CYAN="$(tput setaf 6)"
    local CYAN="\033[0;38;5;87m"
    local WHITE="\033[1;37m"
    local GREEN="\033[0;38;5;83m"
    local  PINK="\033[38;5;99m"

    PS1="$GREEN\$(cur_dir \w)$PINK\$(parse_git_branch) $WHITE> $CYAN"
}

proml