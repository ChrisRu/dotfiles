call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()

set encoding=utf8
set mouse=a
set clipboard=unnamedplus

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

set relativenumber

set ignorecase
set smartcase
set noshowmode
set laststatus=2
let s:hidden_all=1
set noruler
set noshowcmd
set cmdheight=1
set guioptions-=m

autocmd FileType python set breakindentopt=shift:4
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:airline#extensions#tabline#enabled=1
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
