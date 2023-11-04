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
        event = "InsertEnter",
        opts = {},
    },
    {
        -- neovim lsp and its plugins placed here
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile"},
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "glepnir/lspsaga.nvim",
            "hrsh7th/nvim-cmp",
        },
        main = "lsp",
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        config = function ()
            require("configs.rust-tools-config")
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "BufReadPost", "BufNewFile"},
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
        event = { "BufReadPost", "BufNewFile"},
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        main = "lspsaga",
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
        main = "lualine",
        opts = {
            options = { theme = "tokyonight" }
        },
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
        main = "nvim-tree",
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile"},
        main = "gitsigns",
    },
    {
        'TimUntersberger/neogit',
        cmd = "Neogit",
        -- event = { "BufReadPost", "BufNewFile" },
        dependencies = { 'nvim-lua/plenary.nvim' },
        main = "neogit",
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile"},
        main = "todo-comments",
    },
    {
        "folke/trouble.nvim",
        event = { "BufReadPost", "BufNewFile"},
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
        event = { "BufReadPost", "BufNewFile"},
        main = "ibl",
        opts = {},
    },
}

return M
