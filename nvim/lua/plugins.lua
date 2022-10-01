-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- list of nvim plugin using Packer
local packer_startup = require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ------ Treesitter Plugins -----------------

    -- nvim treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = "require('configs.nvim-treesitter-config')",
    }

    -- nvim-ts-autotag -- for auto tag mark-up languages
    use {
        'windwp/nvim-ts-autotag',
        after = "nvim-treesitter"
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }

    use {'tree-sitter/tree-sitter-html'}

    use {'virchau13/tree-sitter-astro'}

    ------------------------------------------

    ------- LSP Plugins -----------------------

    -- nvim lsp configuration
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- nvim-cmp complete pack,
    -- this would help ompletion sources 
    use {'hrsh7th/cmp-nvim-lua'}
    use {'hrsh7th/cmp-nvim-lsp-signature-help'}
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' } -- 

    -- For nvim-cmp - vssnip companion pack
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/vim-vsnip-integ' }

    -- completion framework
    use {
        'hrsh7th/nvim-cmp',
    }

    -- For more LSP Capabilites
    use 'hrsh7th/cmp-nvim-lsp'

    -- For LSP Linter and Diagnostics using null-lsp
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = "require('configs.null-ls-config')",
    }

    -- For pretty LSP UI (more beautiful than nvim-cmp)
    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local status, lspsaga = pcall(require, "lspsaga")
            if not status then
                print("lspsaga.nvim is not installed");
                return
            end
            lspsaga.init_lsp_saga()
        end
    }

    -- For Rust-related development, it shows inline hints and more
    use {
        'simrat39/rust-tools.nvim',
        config = "require('configs.rust-tools-config')",
    }

    -- use { 'glepnir/lspsaga.nvim' }

    -- trouble -- for showing LSP Diagonostic Lists in Quickfix List
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("configs.trouble-config")
        end
    }

    -- Git - shows Git Diffviews in splitview

    -----------------------------------------

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }

    -- which-key using Lua
    use {
        'folke/which-key.nvim',
        config = "require('configs.which-key-config')",
    }

    -- Lua
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            local status, todo_comments = pcall(require, "todo-comments")
            if not status then
                print("todo-comments.nvim plugin is not installed");
                return
            end

            todo_comments.setup({})
        end
    }

    ------- Layout Plugins --------------------

    -- nvim-tree -- a better and performant
    -- file tree explorer written in Lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = "require('nvim-tree').setup{}",
    }

    -- barbar -- for top buffer file bar with icons
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- nvim colorschemes using tjdevries gruvbuddy (using colorbuddy)
    -- use 'tjdevries/colorbuddy.vim'
    -- use 'tjdevries/gruvbuddy.nvim'

    use 'folke/tokyonight.nvim'

    -- lualine status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = "require('configs.lualine-config')",
    }

    -- colorizer -- for showing color in file
    use {
        "norcalli/nvim-colorizer.lua",
        config = "require('colorizer').setup({})",
    }

    -- for indent highlight
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = "require('configs.indent-blankline-config')",
    }

    -------------------------------------------

end)

-- augroup packer_user_config for compiling PackerConfig when changing Packer config
-- Only required if you have packer plugins configured as `opt` --> packadd
vim.cmd [[
  packadd packer.nvim
  packadd nvim-treesitter

  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return packer_startup
