-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer plugins configured as `opt` --> packadd
-- augroup packer_user_config for compiling PackerConfig when changing Packer config
vim.cmd [[
  packadd packer.nvim
  packadd nvim-treesitter
  packadd nvim-ts-rainbow

  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

-- list of nvim plugin using Packer
return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ------ Treesitter Plugins -----------------

    -- nvim treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        cmd = ':TSUpdate',
    }

    -- nvim-ts-autotag -- for auto tag mark-up languages
    use 'windwp/nvim-ts-autotag'

    -- nvim-ts-rainbow -- for showing rainbow on parenthesis 
    -- or block of code
    use 'p00f/nvim-ts-rainbow'

    ------------------------------------------

    ------- LSP Plugins -----------------------

    -- nvim lsp configuration
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- nvim-cmp complete pack
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }

    -- For nvim-cmp - vssnip companion pack
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }


    -- trouble -- for showing LSP Diagonostic Lists in Quickfix List
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -----------------------------------------

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    -- toggleterm for using terminal inside nvim
    -- in an convinient way
    use {"akinsho/toggleterm.nvim"}

    ------- Layout Plugins --------------------

    -- nvim-tree -- for better and performant
    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
    }

    -- barbar -- for top buffer file bar with icons
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- nvim colorschemes using tjdevries gruvbuddy (using colorbuddy)
    use 'tjdevries/colorbuddy.vim'
    use 'tjdevries/gruvbuddy.nvim'

    -- lualine status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- colorizer -- for showing color in file
    use 'norcalli/nvim-colorizer.lua'

    -------------------------------------------

end)
