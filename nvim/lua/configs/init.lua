-- nvim-treesitter Plugin and its configuration
require('configs.nvim-treesitter-config')

-- toggleterm plugin and its configuration
require('configs.toggleterm-config')

-- lspconfig and its plugins configuration
require('configs.lsp-config')

-- null-lsp plugin and its configuration
require('configs.null-ls-config')

-- rust-tools config, for Rust-related development
require('configs.rust-tools-config')

-- which-key plugin and its configuration
require('configs.which-key-config')

-- indent-blankline plugin and its configuration
-- for showing blank lines with symbols
-- such as space, tabs, enter, lines, etc
require('configs.indent-blankline-config')

-- telescope Plugin -- setup directly here
require('telescope').setup{
    defaults = {
        initial_mode = "insert"
    }
}

-- lspsaga, for more IDEs feature in NVIM using nvim's lsp
-- require('configs.lspsaga')

-- -----------------------------------------------------

-- -----------------------------------------------------
-- ----- COLORSCHEME and Layout Plugins ----------------
-- -----------------------------------------------------

-- colorizer - for showing colors in source code
-- setup directly here
require'colorizer'.setup()

-- lualine -- status bar written in Lua
-- plugin and its configuration
require("configs.lualine-config")

-- nvim colorscheme -- written in Lua
-- setup directly here
-- require('colorbuddy').colorscheme('gruvbuddy')

-- nvim-tree file viewer
-- setup directly here
require'nvim-tree'.setup{}

-- -----------------------------------------------------
