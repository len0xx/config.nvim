vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- general
    use 'nvim-lua/plenary.nvim'
    use 'wbthomason/packer.nvim'
    use 'AndrewRadev/splitjoin.vim'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'
    use 'nvim-lualine/lualine.nvim'

    -- tree-viewer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- tabs and buffer management
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    -- sql
    use 'shmup/vim-sql-syntax'

    -- git signs
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release'
    }

    -- tree sitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'

    -- telescope dependencies
    use 'nvim-lua/popup.nvim'
    -- telescope itself
    use 'nvim-telescope/telescope.nvim'

    -- language server
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
	use { 'glepnir/lspsaga.nvim', branch = 'main' }
	use 'jose-elias-alvarez/typescript.nvim'
	use 'onsails/lspkind.nvim'

    -- toggleterm
    use "akinsho/toggleterm.nvim"

    -- themes
    use 'sainnhe/everforest'
    use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
end)
