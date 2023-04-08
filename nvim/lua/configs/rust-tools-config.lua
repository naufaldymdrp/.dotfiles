local rust_tools_ok, rt = pcall(require, 'rust-tools')
if not rust_tools_ok then
    print("rust-tools.nvim plugin is not installed")
    return
end

local opts = {
    server = {
        on_attach = function (_, bufnr)
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<C-.>", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    tools = {
        inlay_hints = {
            -- automatically set inlay hints (type hints)
            auto = true
        }
    }
}

rt.setup(opts)

