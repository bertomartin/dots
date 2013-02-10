syntax enable
colorscheme night

set encoding=utf8
set ffs=unix,dos,mac

filetype plugin on
filetype indent on

set number

set showmatch
set mat=2

set ignorecase

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set cmdheight=2

set ruler

set expandtab
set smarttab

set shiftwidth=2
set softtabstop=2

set autoindent
set smartindent

set guifont=Monaco\ for\ Powerline\ 10

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

map 0 ^

let mapleader = ","
let g:mapleader = ","
map <leader>ss :setlocal spell!<cr>

function! HasPaste()
      if &paste
                return 'PASTE MODE  '
                    en
                        return ''
                      endfunction