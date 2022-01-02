-- nvim-treesitter and its module plugins
require('nvim-treesitter.configs').setup{
    highlight = {
        enable = true
    },
    autotag = {
        enable = true
    },
    rainbow = {
        enable = true,

        -- list of languages you want to disable the plugin for
        -- disable = { "jsx", "cpp" }, 

        -- Also highlight non-bracket delimiters like html tags,
        -- boolean or table: lang -> boolean
        extended_mode = true, 

        -- Do not enable for files with more than n lines, int
        max_file_lines = nil, 
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
}

-- -------------------------------------------------------------------
