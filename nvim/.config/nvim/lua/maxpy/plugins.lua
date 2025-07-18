return {
  -- syntax
  -- 	treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- 	lsp-zero and deps
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
      -- LSP support
      "neovim/nvim-lspconfig",

      -- Auto download LSPs
      "williamboman/mason.nvim",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  -- format
  {
    "stevearc/conform.nvim",
    opts = {},
  },

  -- file search
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- git
  "tpope/vim-fugitive",
  "f-person/git-blame.nvim",
  "mhinz/vim-signify",

  -- color schemes
  "sainnhe/gruvbox-material",
  "sainnhe/everforest",
  "shaunsingh/nord.nvim",

  -- file tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      filesystem = {
        -- This option finds the file when you open Neo-tree
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
    },
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- comment lines
  {
    "numToStr/Comment.nvim",
  },
}
