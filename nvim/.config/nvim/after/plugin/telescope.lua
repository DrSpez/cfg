require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/" },
    vimgrep_arguments = {
      "rg", -- NOTE: ripgrep is required
      "--column",
      "--hidden",
      "--follow",
    },
    layout_strategy = "horizontal",
  },
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>p", function()
  builtin.find_files({ -- NOTE: install 'fd' for faster 'find'
    hidden = true,
    prompt_title = "Find Files",
  })
end, { desc = "Fuzzy-find files. Respects .gitignore" })

vim.keymap.set("n", "<leader>f", function()
  builtin.live_grep({
    additional_args = { "--smart-case", "--fixed-strings" },
    prompt_title = "Live Grep (smart-case, fixed-strings)",
  })
end, { desc = "Find text, case insensitive" })

vim.keymap.set("n", "<leader>F", function()
  builtin.live_grep({
    additional_args = { "--word-regexp" },
    prompt_title = "Live Grep (word-regexp)",
  })
end, { desc = "Find text, regex, case sensitive" })
