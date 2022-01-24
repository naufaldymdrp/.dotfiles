local null_lsp_ok, null_lsp = pcall(require, "null-ls")
if not null_lsp_ok then
    return
end

local formatting = null_lsp.builtins.formatting
local diagnostics = null_lsp.builtins.diagnostics

null_lsp.setup({
    sources = {
        formatting.black.with({ extra_args = { "--fast", "--line-length=80" } }),
        diagnostics.flake8.with({ extra_args = { "--max-line-length=80", "--ignore=E501" } }),
        formatting.rustfmt
    },
})
