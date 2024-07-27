local wk = require("which-key")
local lsp = vim.lsp;

local mappings =
{
    { "<leader>f",   group = "Telescope" },
    { "<leader>fG",  "<CMD>Telescope git_commits<CR>",               desc = "Lists git commit in current workspace" },
    { "<leader>fS",  "<CMD>Telescope live_grep<CR>",                 desc = "Search for a string live as type" },
    { "<leader>fb",  "<CMD>Telescope buffers<CR>",                   desc = "Find opened files in current buffer" },
    { "<leader>fd",  "<CMD>Telescope lsp_definitions<CR>",           desc = "Lists LSP definitions for a word under cursor" },
    { "<leader>fds", "<CMD>Telescope lsp_document_symbols<CR>",      desc = "Lists LSP document symbols in current buffer" },
    { "<leader>ff",  "<CMD>Telescope find_files<CR>",                desc = "Find files in workspace" },
    { "<leader>fg",  "<CMD>Telescope git_bcommits<CR>",              desc = "Lists git commits in current buffer" },
    { "<leader>fr",  "<CMD>Telescope lsp_references<CR>",            desc = "Lists LSP references for a word under cursor" },
    { "<leader>fs",  "<CMD>Telescope grep_string<CR>",               desc = "Search for a string under cursor" },
    { "<leader>fws", "<CMD>Telescope lsp_workspace_symbols<CR>",     desc = "Lists LSP document symbols in current workspace" },
    -- ------------------------------------------------------------------------
    { "<leader>g",   group = "Gitsigns Controls" },
    { "<leader>gb",  "<CMD>Gitsigns blame_line<CR>",                 desc = "Show current line git blame" },
    { "<leader>h",   "<cmd>nohls<cr>",                               desc = "No highlights" },
    -- ------------------------------------------------------------------------
    { "<leader>l",   group = "LSP Controls" },
    { "<leader>lD",  "<CMD>Lspsaga show_line_diagnostics<CR>",       desc = "LSPSaga : Show Line Diagnostics" },
    { "<leader>lK",  "<CMD>Lspsaga hover_doc<CR>",                   desc = "Lspsaga's Hover Documentation" },
    { "<leader>ld",  "<CMD>Lspsaga show_cursor_diagnostics<CR>",     desc = "LSPSaga : Show Cursor Diagnostics" },
    { "<leader>lf",  function() lsp.buf.format() end,                desc = "Format current buffer" },
    { "<leader>lgD", function() lsp.buf.declaration() end,           desc = "Go to Declarations" },
    { "<leader>lgd", function() lsp.buf.definition() end,            desc = "Go to Definitions" },
    { "<leader>lk",  function() lsp.buf.hover() end,                 desc = "Hover" },
    -- ------------------------------------------------------------------------
    { "<leader>t",   group = "Trouble plugin" },
    { "<leader>tT",  "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Trouble Info for Workspace Diagnostics" },
    { "<leader>td",  "<CMD>TroubleToggle lsp_definitions<CR>",       desc = "Trouble Info for LSP Definitions" },
    { "<leader>tr",  "<CMD>TroubleToggle lsp_references<CR>",        desc = "Trouble Info for LSP References" },
    { "<leader>tt",  "<CMD>TroubleToggle document_diagnostics<CR>",  desc = "Trouble Info for Document Diagnostics" },
}

wk.add(mappings)
