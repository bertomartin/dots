execute pathogen#infect()

syntax enable
colorscheme night

set fileencoding=utf8
set encoding=utf8
set ffs=unix,dos,mac

set foldmethod=syntax

filetype on
filetype plugin on
filetype indent on

set visualbell

set cursorline

set number

set cc=80

set winwidth=80
set winheight=5
set winminheight=5
set winheight=999

set list
set listchars=tab:»·,trail:·,eol:™
set showmatch
set mat=2

set ignorecase

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set cmdheight=2

set ruler

set expandtab
set smarttab

set smartcase
set ignorecase
set hlsearch
set gdefault
set incsearch

set shiftwidth=2
set softtabstop=2

set autoindent

set guifont=Monaco\ for\ Powerline\ 10

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

map 0 ^

let mapleader = ","
let g:mapleader = ","
map <leader>ss :setlocal spell!<cr>
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction
