local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = false }

-- ------------------------------------------------------
-- ------ VIM Remaps ------------------------------------
-- ------------------------------------------------------

-- exitsnormal mode using kj keymap
-- vimscript: inoremap kj <Esc>
keymap('i', 'jj', '<Esc>', options)

-- exit terminal mode
-- vimscript: tnoremap <silent> <ESC> <C-\><C-n>
keymap('t', '<Esc>', "<C-\\><C-n>", options)

-- map visual block
-- vimscript : nnoremap <leader>v <C-v>
keymap('n', '<leader>v', '<C-v>', options)

keymap('t', 'jj', '<Esc>', options)

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- -----------------------------------------------------
-- ------ Lspconfig Keymaps  -----------------------------
-- -----------------------------------------------------

keymap('n', 'K', '<cmd>Lspsaga hover_doc<cr>', options)

keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', options)

keymap('n', '<leader>.', '<CMD>Lspsaga code_action<CR>', options)

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- -----------------------------------------------------
-- ------ LspSaga Keymaps  -----------------------------
-- -----------------------------------------------------

-- Show LSP Symbols on (cursor) hover
-- nnoremap <silent>K <CMD>Lspsaga hover_doc<CR>
-- keymap('n', '<leader>K', '<cmd>Lspsaga hover_doc<cr>', options)
-- keymap("n", "<C-;>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- -----------------------------------------------------
-- ------ NvimTree Keymaps  ----------------------------
-- -----------------------------------------------------

keymap('n', '<leader>b', '<cmd>NvimTreeToggle<CR>', options)

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
