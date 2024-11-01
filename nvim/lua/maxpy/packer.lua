-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use({'wbthomason/packer.nvim'})

	-- file search
	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	-- syntax
	-- 	treesitter
	use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
	-- 	lsp-zero and deps
	use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x', requires = {
		-- LSP support
		{'neovim/nvim-lspconfig'},
		-- Autocompletion
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-nvim-lsp'},
	}})

	-- git
	use({'tpope/vim-fugitive'})

	-- color schemes
	use({'sainnhe/gruvbox-material'})
	use({'sainnhe/everforest'})
end)
