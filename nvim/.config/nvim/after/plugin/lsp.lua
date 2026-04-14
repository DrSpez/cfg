-- Reserve a space in the gutter
vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities settings to lspconfig
local capabilities = vim.lsp.protocol.make_client_capabilities()
if capabilities.workspace then
  capabilities.workspace.didChangeWatchedFiles = nil
end
vim.lsp.config("*", {
  capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
  ),
})

-- If LSP is attached to a file
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "x" }, "gf", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  underline = true,
  update_in_insert = false,
})

-- Full list of language servers:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- Bash
vim.lsp.config("bashls", {})
vim.lsp.enable("bashls")

-- Typescript
vim.lsp.config("ts_ls", {
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  on_attach = function(client, bufnr)
    -- don't format - conform plugin is configured to use biome for formatting
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})
vim.lsp.enable("ts_ls")

-- Python
vim.lsp.config("pyright", {})
vim.lsp.enable("pyright")

-- C#
vim.lsp.config("omnisharp", {
  capabilities = capabilities,
  cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  enable_import_completion = true,
  organize_imports_on_format = true,
  enable_roslyn_analyzers = true,
  root_dir = function()
    return vim.loop.cwd() -- current working directory
  end,
  on_attach = function(client, bufnr)
    print("[lspconfig]: attached omnisharp")
  end,
})
vim.lsp.enable("omnisharp")

-- Go
vim.lsp.config("gopls", {})
vim.lsp.enable("gopls")

-- Rust
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false,
      },
    },
  },
})
vim.lsp.enable("rust_analyzer")

-- LaTeX
vim.lsp.config("texlab", {})
vim.lsp.enable("texlab")

local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept selected item or first item
  }),
})
