local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)

vim.keymap.set("n", "<leader>e", function()
  harpoon.ui:toggle_quick_menu(harpoon:list(), {
    title = " Important Files ",
    title_pos = "center",
    ui_width_ratio = 0.50,
    border = "rounded",
  })
end)

-- <leader>i to open file i
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    harpoon:list():select(i)
  end, { desc = "Go to Harpoon file #" .. i })
end
