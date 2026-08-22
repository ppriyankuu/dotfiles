call plug#begin('~/.vim/plugged')
  Plug 'jiangmiao/auto-pairs'
  Plug 'morhetz/gruvbox'   " Only this plugin needed
call plug#end()

set number
set relativenumber
syntax on
set termguicolors

" Gruvbox configuration (must be BEFORE colorscheme)
set background=dark
let g:gruvbox_contrast_dark = 'hard'  " Options: 'soft', 'medium', 'hard'
colorscheme gruvbox

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
