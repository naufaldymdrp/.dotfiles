local rust_tools_ok, rust_tools = pcall(require, 'rust-tools')
if not rust_tools_ok then
    return
end

rust_tools.setup({})

