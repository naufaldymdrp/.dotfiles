" -----------------------------------------------------
" ----- VIM Remaps and Configuration ------------------
" -----------------------------------------------------

" set leader key to "," key
let mapleader=","

" keymap
inoremap kj <Esc>
nnoremap <leader>v <C-v>

" set line numbers on
set number

" set mouse scroll
set mouse=a

" termguicolors
set termguicolors

" colorscheme
let g:tokyonight_style='night'
colorscheme tokyonight

" show n-characters line limit
set colorcolumn=80

set cursorline

" tabspace !!!
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
retab
set smarttab

set completeopt=menu,menuone,noselect

" enable filetype detection together with plugin and indentation
filetype plugin indent on

" for showing syntax
syntax on

" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

" plugins configuration -- using Packer
lua require('plugins')

" keymaps.lua -- for keymaps related plugin
lua require('keymaps')

" configs.lua -- plugin related configuration
lua require('configs')
