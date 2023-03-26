local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
    print("Not module named 'lualine'")
    return
end

-- setup directly here
lualine.setup({
    options = { theme = 'tokyonight' }
})
