map <C-n> :NERDTreeToggle<CR>
set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
syntax on
set mouse=a
set hls!
map <C-s> :setlocal spell!<CR>
command W w
command Wq wq
command HH nohl
filetype plugin indent on
set statusline=%F
set laststatus=2
imap jj <esc>
cmap jj <esc>
nmap ff :NERDTreeToggle<CR>
set noerrorbells
set vb t_vb=
set showmatch
set path=*/**
"" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:jsx_ext_required = 0
set clipboard=unnamedplus
set grepprg=ag
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'neovimhaskell/haskell-vim'
Plug 'shime/vim-livedown'
Plug 'rust-lang/rust.vim'

let g:mkdp_path_to_chrome = 'chrome'

call plug#end()

