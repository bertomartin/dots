# .bash_profile

export EDITOR='subl -w'

alias ..='cd ..'
alias ls='ls -al'
alias sup='npm install'

root='/Users/ssawchukii/dev'
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
alias gls='git log --pretty=format:"%C(reset)%h %C(yellow)%ad%C(yellow)%d %C(reset)%s%C(green) [%cn]" --decorate --date=short'
alias  ga='git add'
alias  gp='git push'
alias  gl='git log --name-status'
alias  gs='git status -s'
alias  gf='git fetch -p'
alias  gm='git commit -m'
alias  gb='git branch'
alias  gc='git checkout'
alias gff='git fetch -p && git rebase origin/master'

function proml {
    local  CYAN="\033[0;30m\]"
    local WHITE="\033[0;37m\]"
    local GREEN="\033[0;32m\]"
    local  PINK="\033[38;5;99m\]"

    PS1="\h\[$GREEN\$(cur_dir \w)\[$PINK\$(parse_git_branch) \[$WHITE> \[$CYAN"
    PS2=">"
}

proml

gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}
