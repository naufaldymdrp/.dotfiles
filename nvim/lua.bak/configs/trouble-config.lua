local trouble_ok, trouble = pcall(require, "trouble")
if not trouble_ok then
    print("folke/trouble.nvim is not available");
    return
end

trouble.setup({})
