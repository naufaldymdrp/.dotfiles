local M = {
    {
        -- treesitter plugins placed here --
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
        config = function()
            require("configs.nvim-treesitter-config")
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        -- neovim lsp and its plugins placed here
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile"},
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "glepnir/lspsaga.nvim",
            "hrsh7th/nvim-cmp"
        },
        config = function()
            require("lsp")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "BufReadPre", "BufNewFile"},
        config = function()
            require("configs/nvim-cmp-config")
        end,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',

            -- For vsnip users.
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
    },
    {
        -- lspsaga, new lspsaga completion/ui
        "glepnir/lspsaga.nvim",
        event = { "BufReadPre", "BufNewFile"},
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lspsaga").setup({})
        end,
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        event = { "BufReadPre", "BufNewFile"},
        config = function()
            require("configs.null-ls-config")
        end
    },
    {
        -- For a beautiful colorscheme
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd([[ colorscheme tokyonight-night ]])
        end
    },
    {
        -- a blazing fast nvim statusbar written in Lua
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "folke/tokyonight.nvim"
        },
        config = function()
            require("lualine").setup({
                options = { theme = "tokyonight" }
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function ()
            require("nvim-tree").setup({})
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile"},
        config = function()
            require("gitsigns").setup({})
        end,
    },
    {
        'TimUntersberger/neogit',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("neogit").setup({})
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile"},
        config = function()
            require("todo-comments").setup({})
        end,
    },
    {
        "folke/trouble.nvim",
        event = { "BufReadPre", "BufNewFile"},
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("configs.trouble-config")
        end,
    },
    {
        'folke/which-key.nvim',
        config = function()
            require('configs.which-key-config')
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile"},
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append "space:⋅"
            vim.opt.listchars:append "eol:↴"

            require("indent_blankline").setup {
                show_end_of_line = true,
                space_char_blankline = " ",
            }
        end,
    },
}

return M
