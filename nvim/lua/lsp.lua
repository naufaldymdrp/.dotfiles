-- ---------------------------------------------------------------------------
require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = { "lua_ls", "omnisharp", "ts_ls", "pyright", "ruff", "clangd", "denols", "zls", "gopls"},
    automatic_enable = {
        exclude = {
            "denols"
        }
    }
})

vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.lsp.config("ts_ls", {
    root_markers = { "package.json" },
    workspace_required = true,
})

vim.lsp.config("denols", {
    root_markers = { "deno.json" },
    workspace_required = true,
})

vim.lsp.config("lua_ls", {
  on_init = function(client)
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {
        diagnostics = {
            globals = { "vim" },
        },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Neovim runtime
      },
    }
  }
})
