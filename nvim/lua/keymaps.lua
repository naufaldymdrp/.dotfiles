local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = false }

-- ------------------------------------------------------
-- ------ VIM Remaps ------------------------------------
-- ------------------------------------------------------

-- exits normal mode using kj keymap
-- inoremap kj <Esc>
keymap('i', 'kj', '<Esc>', options)

-- exit terminal mode
-- tnoremap <silent> <ESC> <C-\><C-n>
keymap('t', '<Esc>', "<C-\\><C-n>", options)

-- map visual block
-- nnoremap <leader>v <C-v>
keymap('n', '<leader>v', '<C-v>', options)

-- ------------------------------------------------------

-- -----------------------------------------------------
-- ------ Telescope Keymaps  ---------------------------
-- -----------------------------------------------------

-- find Files and Buffers

-- find files from current root directory
-- nnoremap <leader>ff <cmd>Telescope find_files<cr>
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)

-- find active buffers
-- nnoremap <leader>fb <cmd>Telescope buffers<cr>
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)

-- Grep

-- find live grep
-- nnoremap <leader>fs <cmd>Telescope live_grep<cr>
keymap('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', options)

-- find grep strings
-- nnoremap <leader>fS <cmd>Telescope grep_string<cr>
keymap('n', '<leader>fS', '<cmd>Telescope grep_string<cr>', options)

-- Help Tags

-- Find help tags
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', options)

-- LSP Symbols

-- Find LSP Workspace Symbols, find symbols across current root directory
-- nnoremap <leader>fI <cmd>Telescope lsp_workspace_symbols<cr>
keymap('n', '<leader>fI', '<cmd>Telescope lsp_workspace_symbols<cr>', options)

-- Find LSP Document Symbols, find symbols in current file
-- nnoremap <leader>fi <cmd>Telescope lsp_document_symbols<cr>
keymap('n', '<leader>fi', '<cmd>Telescope lsp_document_symbols<cr>', options)

-- LSP References

-- Find LSP references
-- nnoremap <leader>fr <cmd>Telescope lsp_references<cr>
keymap('n', '<leader>fr', '<cmd>Telescope lsp_references<cr>', options)

-- Git Commits

-- Find Git Commits
-- nnoremap <leader>fG <cmd>Telescope git_commits<cr>
keymap('n', '<leader>fG', '<cmd>Telescope git_commits<cr>', options)

-- Find Git BCommits
-- nnoremap <leader>fg <cmd>Telescope git_bcommits<cr>
keymap('n', '<leader>fg', '<cmd>Telescope git_bcommits<cr>', options)

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- -----------------------------------------------------
-- ------ Lspconfig Keymaps  -----------------------------
-- -----------------------------------------------------

keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', options)

keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', options)

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- -----------------------------------------------------
-- ------ LspSaga Keymaps  -----------------------------
-- -----------------------------------------------------

-- Show LSP Symbols on (cursor) hover
-- nnoremap <silent>K <CMD>Lspsaga hover_doc<CR>
keymap('n', '<leader>K', '<cmd>Lspsaga hover_doc<cr>', options)

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- -----------------------------------------------------
-- ------ NvimTree Keymaps  ----------------------------
-- -----------------------------------------------------

keymap('n', '<leader>b', '<cmd>NvimTreeToggle<CR>', options)

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
