local customAuGroup = vim.api.nvim_create_augroup("CustomAutocmds", { clear = true })

vim.api.nvim_create_autocmd("BufLeave", {
  group = customAuGroup,
  callback = function()
    closeAllFloatingWindowsInCurrentTab()
  end,
})

function closeAllFloatingWindowsInCurrentTab()
  local windows = vim.api.nvim_tabpage_list_wins(0)
  for _, winid in ipairs(windows) do
    local config = vim.api.nvim_win_get_config(winid)
    if config.relative ~= "" then -- if floating
      vim.api.nvim_win_close(winid, true)
    end
  end
end
