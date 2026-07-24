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
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        provider = "openai_compatible",
        n_completions = 1,
        context_window = 512,
        provider_options = {
          openai_compatible = {
            api_key = "OPEN_WEBUI_API_KEY",
            name = "Ollama",
            end_point = os.getenv("OPEN_WEBUI_BASE_URL") .. "/api/v1/chat/completions",
            model = "qwen2.5-coder:7b",
            stream = true,
            system = {
              prompt = [[
                You are an AI code completion engine.
                Provide contextually appropriate completions based on the context before and after the cursor position.

                CRITICAL GUIDELINES:
                1. Offer completions starting exactly AFTER the characters the user has already typed.
                2. DO NOT repeat or echo any characters/words present immediately before the <cursorPosition> marker. For example, if the user typed "print('Hello wo", your response must start with "rld!')", NOT "print('Hello world!')".
                3. Return the result directly without markdown code fences or conversational text.
              ]],
            },
            optional = {
              max_tokens = 56,
              top_p = 0.9,
              chat_id = "neovim-completion-session-uuid-12345", -- NOTE: mock chat id
            },
          },
        },
        virtualtext = {
          enable = true,
          show_on_completion_menu = true,
          auto_trigger_ft = { "lua", "python", "javascript", "typescript", "typescriptreact", "go" },
          keymap = {
            accept = "<C-f>",
            accept_line = "<C-g>",
            next = "<C-Right>",
            prev = "<C-Left>",
            dismiss = "<C-d>",
          },
        },
      })
    end,
  },
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
