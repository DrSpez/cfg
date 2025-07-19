require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },
    javascript = { "biome", "prettier", stop_at_first = true },
    typescript = { "biome", "prettier", stop_at_first = true },
    typescriptreact = { "prettier", "biome", stop_at_first = true },
    ["_"] = { "lsp" }, -- default everything else to LSP formatter
  },
  formatters = {
    stylua = {
      prepend_args = {
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
      },
    },
    biome = {
      -- Statically define the command to use the local executable
      command = "node_modules/.bin/biome",
      -- Add a condition to check if the local executable exists before running
      condition = function(ctx)
        return vim.fs.find({ "node_modules/.bin/biome" }, {
          path = ctx.dirname,
          upward = true,
          limit = 1,
          type = "file",
        })[1]
      end,
      args = {
        "format",
        "--stdin-file-path",
        "$FILENAME",
        "--fix",
      },
    },
    prettier = {
      command = "prettier",
      -- Conform will run this command to determine if the formatter is available.
      -- If it is not, it will not be used.
      condition = function(ctx)
        return vim.fs.find({ "node_modules/.bin/prettier" }, {
          path = ctx.dirname,
          upward = true,
          limit = 1,
        })[1]
      end,
    },
  },
  format_on_save = {
    timeout_ms = 500,
  },
})
