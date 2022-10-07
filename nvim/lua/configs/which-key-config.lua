local wk = require("which-key")
local lsp = vim.lsp;
local diag = vim.diagnostic

local mappings = {
    f = {
        name = "Telescope",
        f = { "<CMD>Telescope find_files<CR>", "Find files in workspace" },
        b = { "<CMD>Telescope buffers<CR>", "Find opened files in current buffer" },
        s = { "<CMD>Telescope grep_string<CR>", "Search for a string under cursor" },
        S = { "<CMD>Telescope live_grep<CR>", "Search for a string live as type" },
        r = { "<CMD>Telescope lsp_references<CR>", "Lists LSP references for a word under cursor" },
        d = { "<CMD>Telescope lsp_definitions<CR>", "Lists LSP definitions for a word under cursor" },
        ['ds'] = { "<CMD>Telescope lsp_document_symbols<CR>", "Lists LSP document symbols in current buffer" },
        ['ws'] = { "<CMD>Telescope lsp_workspace_symbols<CR>", "Lists LSP document symbols in current workspace" },
        g = { "<CMD>Telescope git_bcommits<CR>", "Lists git commits in current buffer" },
        G = { "<CMD>Telescope git_commits<CR>", "Lists git commit in current workspace" },
    },
    l = {
        name = "LSP Controls",
        k = { function() lsp.buf.hover() end, "Hover" },
        K = { "<CMD>Lspsaga hover_doc<CR>", "Lspsaga's Hover Documentation" },
        f = { function() lsp.buf.format({ async = true }) end, "Format current buffer" },
        d = { "<CMD>Lspsaga show_cursor_diagnostics<CR>", "LSPSaga : Show Cursor Diagnostics" },
        D = { "<CMD>Lspsaga show_line_diagnostics<CR>", "LSPSaga : Show Line Diagnostics" },
        ['gd'] = { function() lsp.buf.definition() end, "Go to Definitions" },
        ['gD'] = { function() lsp.buf.declaration() end, "Go to Declarations" },
    },
    h = { "<cmd>nohls<cr>", "No highlights" },
    t = {
        name = "Trouble plugin",
        t = { "<CMD>TroubleToggle document_diagnostics<CR>", "Trouble Info for Document Diagnostics" },
        T = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Trouble Info for Workspace Diagnostics" },
        r = { "<CMD>TroubleToggle lsp_references<CR>", "Trouble Info for LSP References" },
        d = { "<CMD>TroubleToggle lsp_definitions<CR>", "Trouble Info for LSP Definitions" },
    },
}
local options = {
    prefix = "<leader>"
}

wk.register(mappings, options)
