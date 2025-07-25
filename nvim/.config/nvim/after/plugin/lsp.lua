local lspconfig = require("lspconfig")

-- Reserve a space in the gutter
vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = lspconfig.util.default_config
lspconfig_defaults.capabilities =
  vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- If LSP is attached to a file
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set({ "n", "x" }, "gf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
    vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  end,
})

-- Full list of language servers:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- Bash
lspconfig.bashls.setup({})

-- Typescript
lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    -- don't format - biome is set up for formatting
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    if client.name == "ts_ls" then
      client.server_capabilities.codeActionProvider = {
        codeActionKinds = { "quickfix", "refactor" },
      }
    end
  end,
})
lspconfig.biome.setup({
  -- Add this on_attach function
  on_attach = function(client, bufnr)
    -- This disables LSP formatting capabilities only for the biome server
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,

  -- This is your existing command to find the local executable
  cmd = (function()
    local executable = vim.fs.find({ "node_modules/.bin/biome" }, {
      upward = true,
      limit = 1,
      type = "file",
      path = vim.api.nvim_buf_get_name(0),
    })[1]
    return { executable or "biome", "lsp-proxy" }
  end)(),

  settings = {
    ["biome"] = {
      ["require_cwd"] = true,
    },
  },
})

-- Python
lspconfig.pyright.setup({})

-- C#
lspconfig.omnisharp.setup({
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

-- Go
lspconfig.gopls.setup({})

-- Rust
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false,
      },
    },
  },
})

-- LaTeX
lspconfig.texlab.setup({})

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
