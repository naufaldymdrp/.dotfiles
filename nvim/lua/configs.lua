-- nvim-treesitter Plugin and its configuration
require('configs.nvim-treesitter')

-- toggleterm plugin and its configuration
require('configs.toggleterm')

-- telescope Plugin
require('telescope').setup{
    defaults = {
        initial_mode = "insert"
    }
}

-- lspconfig and its plugins configuration
require('configs.lspconfig')

-- -----------------------------------------------------

-- -----------------------------------------------------
-- ----- COLORSCHEME Plugins ---------------------------
-- -----------------------------------------------------

-- colorizer - for showing colors in source code
require'colorizer'.setup()

-- nvim colorscheme -- written in Lua
require('colorbuddy').colorscheme('gruvbuddy')

-- lualine -- status bar written in Lua
require'lualine'.setup {
    options = { theme = 'material' }
}

-- -----------------------------------------------------
