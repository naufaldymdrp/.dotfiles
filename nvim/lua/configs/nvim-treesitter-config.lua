-- nvim-treesitter and its module plugins
local status, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status then
    print("nvim-treesitter plugin is not installed")
    return
end

nvim_treesitter_configs.setup{
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    ensure_installed = {
        'tsx', 'json', 'html', 'css', 'lua', 'vim', 'vimdoc',
        'typescript', 'javascript', 'astro', 'svelte',
        'markdown', 'markdown_inline',
        'c_sharp', 'c', 'cpp', 'rust', 'zig'
    }
}

-- -------------------------------------------------------------------
