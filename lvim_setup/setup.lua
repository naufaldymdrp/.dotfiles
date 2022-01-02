set completeopt=menu,menuone,noselect

-------------------------------------------
---- Begin Setup ---- nvim-cmp ------------
-------------------------------------------

-- local cmp = require'cmp'

-- cmp.setup({
--   snippet = {
--     -- REQUIRED - you must specify a snippet engine
--     expand = function(args)
--       vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--       -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--       -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--       -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
--     end,
--   },
--   mapping = {
--     ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--     ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--     ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--     ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--     ['<C-e>'] = cmp.mapping({
--       i = cmp.mapping.abort(),
--       c = cmp.mapping.close(),
--     }),
--     -- Accept currently selected item. If none selected, `select` first item.
--     -- Set `select` to `false` to only confirm explicitly selected items.
--     ['<CR>'] = cmp.mapping.confirm({ select = true }),
--   },
--   sources = cmp.config.sources({
--     { name = 'nvim_lsp' },
--     { name = 'vsnip' }, -- For vsnip users.
--     -- { name = 'luasnip' }, -- For luasnip users.
--     -- { name = 'ultisnips' }, -- For ultisnips users.
--     -- { name = 'snippy' }, -- For snippy users.
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })

-- -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['rust_analyzer'].setup {
--   capabilities = capabilities
-- }

-------------------------------------------
---- End Setup ---- nvim-cmp --------------
-------------------------------------------

-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--

-------------------------------------------
---- Begin Setup ---- Telescope -----------
-------------------------------------------

lvim.lsp.on_attach_callback = function(client, bufnr)
   local function buf_set_option(...)
     vim.api.nvim_buf_set_option(bufnr, ...)
   end
   --Enable completion triggered by <c-x><c-o>
   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(...)
    end

    -- options
    opts = { noremap=true, silent=true }

    -- go to declaration
    buf_set_keymap(0, 'n', 'gD', '<cmd> lua vim.lsp.buf.declaration()<CR>', opts)
    -- trigger hover
    buf_set_keymap(0, 'n', '<leader>i', '<cmd> lua vim.lsp.buf.hover()<CR>', opts)
 end

-------------------------------------------
---- End Setup ---- Telescope -----------
-------------------------------------------
