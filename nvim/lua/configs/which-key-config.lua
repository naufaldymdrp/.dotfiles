local wk = require("which-key")
local lsp = vim.lsp;
local diag = vim.diagnostic

local mappings = {
    l = {
        name = "LSP-related Things",
        k = { function() lsp.buf.hover() end, "Hover" },
        K = { function() lsp.buf.signature_help() end, "Show Signature Help" },
        f = { function() lsp.buf.formatting() end, "Format current buffer" },
        d = { function() diag.open_float() end, "Open Diagnostics" },
        ['gd'] = { function() lsp.buf.definition() end, "Go to Definitions" },
        ['gD'] = { function() lsp.buf.declaration() end, "Go to Declarations" },
    },
    h = { "<cmd>nohls<cr>", "No highlights" },
}
local options = {
    prefix = "<leader><leader>"
}

wk.register(mappings, options)
