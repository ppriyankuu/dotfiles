call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

call plug#end()

set number
set relativenumber
syntax on

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
