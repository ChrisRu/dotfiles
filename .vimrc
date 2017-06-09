call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/syntastic'
Plug 'sekel/vim-vue-syntastic'
Plug 'jaxbot/syntastic-react'
Plug 'burnettk/vim-angular'

Plug 'scrooloose/nerdcommenter'
Plug 'valloric/youcompleteme'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }

call plug#end()

filetype on
syntax on
colorscheme Tomorrow-Night

set encoding=utf8
set mouse=a
set clipboard=unnamedplus
set magic

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set smartindent
set autoindent

set showmatch
set relativenumber

set ignorecase
set smartcase

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufWritePre * :%s/\s\+$//e
