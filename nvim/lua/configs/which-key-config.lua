local wk = require("which-key")
local lsp = vim.lsp;
local diag = vim.diagnostic

local mappings = {
    l = {
        name = "LSP-related Things",
        K = { function() lsp.buf.hover() end, "Hover" },
        d = { function() diag.open_float() end, "Open Diagnostics" },
    },
}
local options = {
    prefix = "<leader><leader>"
}

wk.register(mappings, options)
