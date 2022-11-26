return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'morhetz/gruvbox'
    use 'jreybert/vimagit'
    use 'tpope/vim-fugitive'
    use 'airblade/vim-rooter'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'neovim/nvim-lsp'
    use 'neovim/nvim-lspconfig'
    use 'nvim-telescope/telescope.nvim'
    use 'hashivim/vim-terraform'
    use 'LnL7/vim-nix'

    use 'honza/vim-snippets'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'

    use {'L3MON4D3/LuaSnip', run = "make install_jsregexp"}
    use 'saadparwaiz1/cmp_luasnip'

    use 'nvim-treesitter/nvim-treesitter'

    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

    use {"akinsho/toggleterm.nvim", tag = '2.3.0'}
    require("toggleterm").setup{
        open_mapping = [[<c-§>]]
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    require("nvim-tree").setup{}
end)
