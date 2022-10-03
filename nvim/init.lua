-- -----------------------------------------------------
-- ----- VIM Remaps and Configuration ------------------
-- -----------------------------------------------------

local g = vim.g -- global variable
local set = vim.o -- global options

-- set leader key to "," key
-- let mapleader=","
g.mapleader = ","

-- set line numbers on
-- Vim: set number
set.number = true

-- set mouse scroll
-- Vim: set mouse=a
set.mouse = 'a'

-- termguicolors
-- Vim: set termguicolors
set.termguicolors = true

-- colorscheme
-- Vim: colorscheme tokyonight

-- show n-characters line limit
-- set colorcolumn=80
set.colorcolumn = '80'

-- set cursorline
set.cursorline = true

-- tabspace, smarttab, etc !!!
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smarttab = true
vim.cmd [[ retab ]]

set.completeopt="menu,menuone,noselect"

-- set timeout length
set.timeoutlen = 200

-- enable filetype detection together with plugin and indentation
vim.cmd [[ filetype plugin indent on ]]

-- for showing syntax
vim.cmd [[ syntax on ]]

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- plugins configuration -- using Packer
-- lua require('plugins')
require('plugins')

-- keymaps.lua -- for keymaps related plugin
-- lua require('keymaps')
require('keymaps')

-- configs.lua -- plugin related configuration
-- lua require('configs')
require('lsp')
