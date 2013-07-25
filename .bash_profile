# .bash_profile

export EDITOR='vim'
export GIT_EDITOR='vim'

alias ..='cd ..'
alias ...='cd .. && cd ..'
alias ls='ls -al'
alias dev='cd ~/dev'
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

# clones a repository, cds into it, and opens it in my editor.
# - arg 1 - url|username|repo remote endpoint, username on github, or name of
#           repository.
# - arg 2 - (optional) name of repo
#
# usage:
#   $ clone things
#     .. git clone git@github.com:stephenplusplus/things.git things
#     .. cd things
#     .. subl .
#
#   $ clone git@github.com:stephenplusplus/dots.git
#     .. git clone git@github.com:stephenplusplus/dots.git dots
#     .. cd dots
#     .. subl .
#
#   $ clone yeoman generator
#     .. git clone git@github.com:yeoman/generator.git generator
#     .. cd generator
#     .. subl .
function clone {
  local url=$1;
  local repo=$2;

  if [[ ${url:0:4} == 'http' || ${url:0:3} == 'git' ]]
  then
    # just clone this thing.
    repo=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
  elif [[ -z $repo ]]
  then
    # my own stuff.
    repo=$url;
    url="git@github.com:stephenplusplus/$repo";
  else
    # not my own, but I know whose it is.
    url="git@github.com:$url/$repo.git";
  fi

  git clone $url $repo && cd $repo && subl .;
}

alias  gam='git commit -am'
alias  grm='git rm'
alias  gmv='git mv'
alias  grr='git reset --hard HEAD'
alias goop="git commit --amend -C HEAD -n"
alias  gls='git log --pretty=format:"%C(reset)%h %C(yellow)%ad%C(yellow)%d %C(reset)%s%C(green) [%cn]" --decorate --date=short'
alias   ga='git add'
alias   gp='git push'
alias   gl='git log --name-status'
alias   gs='git status'
alias   gf='git fetch -p'
alias   gm='git commit -m'
alias   gb='git branch'
alias   gc='git checkout'
alias  gff="git fetch -p && git rebase origin/\$(just_git_branch)"
