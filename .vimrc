set nocompatible
execute pathogen#infect()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows=0
let g:nerdtree_tabs_open_on_console_startup=1

Bundle "gmarik/vundle"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

Bundle "garbas/vim-snipmate"

syntax enable
colorscheme grape

set fileencoding=utf8
set encoding=utf8
set ffs=unix,dos,mac

set foldmethod=syntax

filetype off
filetype plugin on
filetype indent on

set visualbell

set cursorline

set number

highlight OverLength ctermbg=white ctermfg=darkred guibg=#592929
match OverLength /\%81v.\+/

set winwidth=80
set winheight=5
set winminheight=5
set winheight=999

set list
set listchars=tab:»·,trail:·,eol:…
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
