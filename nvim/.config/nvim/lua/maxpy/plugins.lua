return {
  -- syntax
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        highlight = { enable = true },
      })

      require("nvim-treesitter").install({
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "lua",
        "python",
        "c",
        "c_sharp",
        "json",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
      })
    end,
  },
  -- LSP support
  { "neovim/nvim-lspconfig" },
  -- Auto download LSPs
  { "mason-org/mason.nvim" },
  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },

  -- formatting
  {
    "stevearc/conform.nvim",
    opts = {},
  },

  -- file search
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional but recommended
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
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
