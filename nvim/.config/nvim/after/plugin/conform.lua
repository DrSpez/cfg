require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "biome", "prettier", stop_at_first = true },
    typescript = { "biome" },
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
      command = function(self, ctx)
        -- vim.fs.find searches upward from the current buffer's path
        local biome_executable = vim.fs.find({
          "node_modules/.bin/biome",
        }, {
          path = ctx.dirname,
          upward = true,
          limit = 1,
          type = "file",
        })[1]
        -- If a local executable is found, return its full path.
        -- Otherwise, return the default "biome" command.
        return biome_executable or "biome"
      end,
      args = {
        "format",
        "--skip-errors",
        "--stdin-file-path",
        "$FILENAME",
        "--fix",
      },
    },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
