require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/" },
    vimgrep_arguments = {
      "rg", -- NOTE: ripgrep is required
      "--column",
      "--smart-case",
      "--hidden",
      "--follow",
    },
    layout_strategy = "horizontal",
  },
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>p", function()
  builtin.find_files({
    hidden = true,
  })
end, { desc = "Fuzzy-find files. Respects .gitignore" })

vim.keymap.set("n", "<leader>F", function()
  builtin.live_grep({
    additional_args = { "--case-sensitive" },
  })
end, { desc = "Find text, regex, case sensitive" })

vim.keymap.set("n", "<leader>f", function()
  builtin.live_grep({
    additional_args = { "--smart-case" },
  })
end, { desc = "Find text, case insensitive" })
