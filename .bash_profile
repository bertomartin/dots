# .bash_profile

export EDITOR='vim'
export GIT_EDITOR='vim'

alias ..='cd ..'
alias ...='cd .. && cd ..'
alias ls='ls -al'
alias sup='npm install'

root='/Users/ssawchukii/dev'
function cur_dir {
  local dir=$1
  echo ${dir/$root/}
}

function just_git_branch {
  local branch=$(parse_git_branch)
  local length=${#branch}-3
  echo ${branch:2:length}
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function play {
  local num=$[($RANDOM % 13843) + 1]
  cd ~/dev/play && mkdir $num && cd $_
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



