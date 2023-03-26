local rust_tools_ok, rust_tools = pcall(require, 'rust-tools')
if not rust_tools_ok then
    print("rust-tools.nvim plugin is not installed")
    return
end

rust_tools.setup({})

