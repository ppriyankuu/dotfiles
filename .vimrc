call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

call plug#end()

set number
set relativenumber
syntax on

set termguicolors

highlight Statement ctermfg=172 guifg=#d68044
highlight String ctermfg=114 guifg=#68D450

filetype plugin indent on
set autoindent
set smartindent
set cindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set mouse=a

vnoremap Y "+y
