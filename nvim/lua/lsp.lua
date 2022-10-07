-- ---------------------------------------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup()

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require("lspconfig")
lspconfig.omnisharp.setup({})

-- Web Related Development
lspconfig.tsserver.setup({})
lspconfig.svelte.setup({})
lspconfig.astro.setup({})
lspconfig.pyright.setup({})
lspconfig.clangd.setup({})
lspconfig.cmake.setup({})

lspconfig.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
        },
    }
})

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "init.lua")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local library = {}

local function add(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
        p = vim.loop.fs_realpath(p)
        library[p] = true
    end
end

-- add runtime libraries
add("$VIMRUNTIME") -- vim runtime libraries themself
add("$VIMRUNTIME/lua") -- vim runtime libraries themself
add("$VIMRUNTIME/lua/vim/lsp") -- vim runtime libraries themself
add("$XDG_CONFIG_HOME/nvim") -- vim lua plugin script
-- add vim libraries added by packer
if vim.fn.has('win32') == 1 then
    add("$XDG_DATA_HOME/nvim-data/site/pack/packer/opt/*")
    add("$XDG_DATA_HOME/nvim-data/site/pack/packer/start/*")
else
    add("$XDG_DATA_HOME/nvim/site/pack/packer/opt/*")
    add("$XDG_DATA_HOME/nvim/site/pack/packer/start/*")
end

lspconfig.sumneko_lua.setup({
    settings = {
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
                    library = library,
                    maxPreload = 2000,
                    preloadFileSize = 50000,
                },
                -- do not send telemetry data
                telemetry = {
                    enable = false,
                },
            }
    }
})


-- local server_options = {
--     -- sumneko language server
--     ['sumneko_lua'] = function(options)
--         options.on_new_config = function(config, root)
--             local libs = vim.tbl_deep_extend("force", {}, library)
--             libs[root] = nil
--             config.settings.Lua.workspace.library = libs
-- 
--             return config
--         end
--         options.settings = --         }
--     end,
--     -- rust-analyzer language server
--     
-- }


-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
--     local opts = {
--         -- on_attach = on_attach,
--         capabilities = capabilities,
--     }
-- 
--     -- local capabilities = vim.lsp.
-- 
--     -- (optional) Customize the options passed to the server
--     -- if server.name == "tsserver" then
--     --     opts.root_dir = function() ... end
--     -- end
-- 
--     if server_options[server.name] then
--         -- enhance default options with server specific options
--         server_options[server.name](opts)
--     end
-- 
--     -- This setup() function is exactly the same as lspconfig's setup function.
--     -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--     server:setup(opts)
-- end)

-- nvim_cmp config -- for autocompletion to turn on
require('configs.nvim-cmp-config')
