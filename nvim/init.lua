-- -----------------------------------------------------
-- ----- VIM Remaps and Configuration ------------------
-- -----------------------------------------------------

local g = vim.g -- global variable
local set = vim.o -- global options
local fn = vim.fn -- built in functions

-- set leader key to "," key
-- let mapleader=","
g.mapleader = ","

-- set line numbers on
-- Vim: set number
set.number = true
set.relativenumber = true

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
set.nuw = 4
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

-- initialize 'lazy.nvim'
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
require("keymaps")
local plugins = require("plugins")

require("lazy").setup(plugins)

if fn.has("linux") == 1 then
    set.shell = "bash"
elseif fn.has("win32") == 1 then
    set.shell="pwsh"
end
