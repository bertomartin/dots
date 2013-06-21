# .bash_profile

export EDITOR='vim'
export GIT_EDITOR='vim'

alias ..='cd ..'
alias ...='cd .. && cd ..'
alias ls='ls -al'
alias sup='npm install'
alias grunt='grunt --stack'

# create a play directory.
# - arg - (optional) name of a generator
#
# usage:
#   $ play
#       ..creates a directory
#       ..cds into it
#
#   $ play angular
#       ..creates a directory
#       ..cds into it
#       ..runs `yo angular`
function play {
  cd ~/dev/play && mkdir yeah-$[($RANDOM % 13843) + 1] && cd $_
  if [ $1 ]
  then
    yo $1
  fi
}

# snap over to a generator right quick.
# - arg - (optional) name of a generator
#
# usage:
#   $ gen angular
#       ..cds into `generator-angular` directory
#
#   $ gen yo
#       ..cds into `yo` directory
#
#   $ gen
#       ..cds into `generator` directory
function gen {
  if [[ -z $1 ]]
  then
    cd ~/dev/generator
  elif [ $1 == 'yo' ]
  then
    cd ~/dev/yo
  else
    cd ~/dev/generator-$1
  fi
}

## git.
function just_git_branch {
  local branch=$(parse_git_branch)
  local length=${#branch}-3
  echo ${branch:2:length}
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias gam='git commit -am'
alias grm='git rm'
alias gmv='git mv'
alias grr='git reset --hard HEAD'
alias gls='git log --pretty=format:"%C(reset)%h %C(yellow)%ad%C(yellow)%d %C(reset)%s%C(green) [%cn]" --decorate --date=short'
alias  ga='git add'
alias  gp='git push'
alias  gl='git log --name-status'
alias  gs='git status'
alias  gf='git fetch -p'
alias  gm='git commit -m'
alias  gb='git branch'
alias  gc='git checkout'
alias gff="git fetch -p && git rebase origin/\$(just_git_branch)"
