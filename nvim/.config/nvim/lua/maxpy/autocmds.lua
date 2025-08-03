local customAuGroup = vim.api.nvim_create_augroup("CustomAutocmds", { clear = true })

vim.api.nvim_create_autocmd("BufLeave", {
  group = customAuGroup,
  callback = function()
    closeLSPFloatingWindowsInCurrentTab() -- fixes the LSP floating windows getting stuck on harpoon buf switch
  end,
})

function closeLSPFloatingWindowsInCurrentTab()
  local windows = vim.api.nvim_tabpage_list_wins(0)
  for _, winid in ipairs(windows) do
    local config = vim.api.nvim_win_get_config(winid)
    if config.relative ~= "" then -- if floating window
      local bufnr = vim.api.nvim_win_get_buf(winid)
      local filetype = vim.bo[bufnr].filetype
      if filetype == "help" or filetype == "markdown" or filetype == "lspinfo" then -- if lsp-related filetype
        vim.api.nvim_win_close(winid, true)
      end
    end
  end
end
