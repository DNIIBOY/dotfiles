vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    use 'folke/tokyonight.nvim'
    use 'github/copilot.vim'

    use 'rmagatti/alternate-toggler'
    use 'windwp/nvim-autopairs'
    use 'gcmt/wildfire.vim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'

    use({
        'kylechui/nvim-surround', -- This supports dsf
        tag = '*',
        config = function()
            require('nvim-surround').setup()
        end
    })

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'iamcco/markdown-preview.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'windwp/nvim-ts-autotag'
    use 'p00f/nvim-ts-rainbow'

    use 'lewis6991/gitsigns.nvim'
    use 'stevearc/dressing.nvim'
    use 'stevearc/vim-arduino'
    use {
        'folke/todo-comments.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }
    use 'segeljakt/vim-silicon'
    use 'tommcdo/vim-exchange'
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-lint'
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
    use({
        'utilyre/barbecue.nvim',
        tag = '*',
        requires = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons', -- optional dependency
        },
        config = function()
            require('barbecue').setup()
        end,
    })
    use({
        'folke/neodev.nvim',
        config = function()
            require('neodev').setup()
        end
    })
    use {
        'ThePrimeagen/refactoring.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-treesitter/nvim-treesitter' }
        }
    }
    use {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = {
            { 'nvim-lua/plenary.nvim' },
        }
    }
    use 'tpope/vim-obsession'
    use 'christoomey/vim-tmux-navigator'
end)
