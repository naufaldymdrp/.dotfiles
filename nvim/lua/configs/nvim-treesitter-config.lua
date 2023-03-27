-- nvim-treesitter and its module plugins
local status, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status then
    print("nvim-treesitter plugin is not installed")
    return
end

nvim_treesitter_configs.setup{
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    autotag = {
        enable = true
    },
    ensure_installed = {
        'tsx', 'json', 'html', 'css', 'lua', 'vim', 
        'typescript', 'javascript', 'astro', 'svelte',
        'markdown', 'markdown_inline',
        'c_sharp', 'c', 'cpp', 'rust', 'zig'
    }
}

-- -------------------------------------------------------------------
