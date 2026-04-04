require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },
    javascript = { "biome", "biome-organize-imports" },
    javascriptreact = { "biome", "biome-organize-imports" },
    typescript = { "biome", "biome-organize-imports" },
    typescriptreact = { "biome", "biome-organize-imports" },
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
      command = vim.fn.stdpath("data") .. "/mason/bin/biome",
      args = {
        "format",
        "--stdin-file-path",
        "$FILENAME",
        "--fix",
        "--indent-style",
        "space",
        "--indent-width",
        "2",
      },
    },
  },
  format_on_save = {
    timeout_ms = 500,
  },
})
