return {
    -- file search
    {
        'nvim-telescope/telescope.nvim', version = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- syntax
    -- 	treesitter
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    -- 	lsp-zero and deps
    {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x', dependencies = {
        -- LSP support
        'neovim/nvim-lspconfig',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
    }},

    -- git
    'tpope/vim-fugitive',

    -- color schemes
    'sainnhe/gruvbox-material',
    'sainnhe/everforest',
}
