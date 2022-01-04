-- -- for LSP Configuration to start
-- local lspconfig = require('lspconfig')

-- -- for pyright LSP
-- lspconfig.pyright.setup{}

-- -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- lspconfig.pyright.setup {
--   capabilities = capabilities
-- }

-- ---------------------------------------------------------------------------
local lsp_installer = require("nvim-lsp-installer")

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

Library = {}

local function add(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
        p = vim.loop.fs_realpath(p)
        Library[p] = true
    end
end

-- add runtime libraries
add("$VIMRUNTIME") -- vim runtime libraries themself
add("$XDG_CONFIG_HOME/nvim") -- vim lua plugin script
-- add vim libraries added by packer
if vim.fn.has('win32') == 1 then
    add("$XDG_DATA_HOME/nvim-data/site/pack/packer/opt/*")
    add("$XDG_DATA_HOME/nvim-data/site/pack/packer/start/*")
else
    add("$XDG_DATA_HOME/nvim/site/pack/packer/opt/*")
    add("$XDG_DATA_HOME/nvim/site/pack/packer/start/*")
end

-- local function on_attach(client, bufnr)
--     -- local function alias
--     local function buf_set_keymap(...)
--         vim.api.nvim_buf_set_keymap(...)
--     end
-- 
--     -- set up buffer-local keymaps
-- end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local server_options = {
    -- sumneko language server
    ['sumneko_lua'] = function(options)
        options.on_new_config = function(config, root)
            local libs = vim.tbl_deep_extend("force", {}, Library)
            libs[root] = nil
            config.settings.Lua.workspace.library = libs

            return config
        end
        options.settings = {
            Lua = {
                runtime = {
                    -- Lua version
                    version = 'LuaJIT',
                    path = runtime_path,
                },
                completion = { callSnippet = "Both" },
                diagnostics = {
                    globals = {'vim', 'use'},
                },
                workspace = {
                    library = Library,
                    maxPreload = 2000,
                    preloadFileSize = 50000,
                },
                -- do not send telemetry data
                telemetry = {
                    enable = false,
                },
            }
        }
    end,
}

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        -- on_attach = on_attach,
        capabilities = capabilities,
    }

    -- local capabilities = vim.lsp.

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server_options[server.name] then
        -- enhance default options with server specific options
        server_options[server.name](opts)
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- nvim_cmp config -- for autocompletion to turn on
require('configs.nvim-cmp-config')
