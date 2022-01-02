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

" show n-characters line limit
set colorcolumn=80

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

" configs.lua -- plugin related configuration
lua require('configs')

" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

" -----------------------------------------------------
" ------ Telescope Keymaps  ---------------------------
" -----------------------------------------------------

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fS <cmd>Telescope grep_string<cr>

nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>fI <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>fi <cmd>Telescope lsp_document_symbols<cr>

nnoremap <leader>fr <cmd>Telescope lsp_references<cr>

nnoremap <leader>fG <cmd>Telescope git_commits<cr>
nnoremap <leader>fg <cmd>Telescope git_bcommits<cr>

" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
