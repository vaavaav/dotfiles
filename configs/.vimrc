syntax on
set relativenumber
set number
set nocompatible
set tabstop=2
" Slim cursor
set guicursor=i-ci:ver10-iCursor

" Rainbow Parentheses
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Rainbow CSV
autocmd BufNewFile,BufRead *.csv   set filetype=csv_semicolon

" Plug
call plug#begin('~/.vim/plugged')

Plug 'junegunn/rainbow_parentheses.vim'
Plug 'sickill/vim-monokai'
Plug 'mechatroner/rainbow_csv'
Plug 'valloric/youcompleteme'
Plug 'scrooloose/nerdtree'

call plug#end()

colorscheme monokai
