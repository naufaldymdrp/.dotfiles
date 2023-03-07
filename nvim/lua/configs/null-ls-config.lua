local null_lsp_ok, null_lsp = pcall(require, "null-ls")
if not null_lsp_ok then
    return
end

local formatting = null_lsp.builtins.formatting
local diagnostics = null_lsp.builtins.diagnostics

local methods = require("null-ls.methods")
local helpers = require("null-ls.helpers")

local function ruff_fix()
    return helpers.make_builtin({
        name = "ruff",
        meta = {
            url = "https://github.com/charliermarsh/ruff/",
            description = "An extremely fast Python linter, written in Rust.",
        },
        method = methods.internal.FORMATTING,
        filetypes = { "python" },
        generator_opts = {
            command = "ruff",
            args = { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" },
            to_stdin = true
        },
        factory = helpers.formatter_factory
    })
end

null_lsp.setup({
    sources = {
        -- formatting.black.with({ extra_args = { "--fast", "--line-length=80" } }),
        -- diagnostics.flake8.with({ extra_args = { "--max-line-length=80", "--ignore=E501" } }),
        ruff_fix(),
        diagnostics.ruff,
        formatting.clang_format
        -- formatting["rust_analyzer"].with({ extra_args = { "--edition=2021" }})
    },
})
