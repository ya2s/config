local tmux_dir = { h = 'L', j = 'D', k = 'U', l = 'R' }

local function navigate(dir)
  local win = vim.api.nvim_get_current_win()
  vim.cmd('wincmd ' .. dir)
  if win == vim.api.nvim_get_current_win() then
    vim.system({ 'tmux', 'select-pane', '-' .. tmux_dir[dir] })
  end
end

vim.keymap.set({ "n", "t" }, "<C-w>h", function() navigate('h') end, { silent = true })
vim.keymap.set({ "n", "t" }, "<C-w>l", function() navigate('l') end, { silent = true })
vim.keymap.set({ "n", "t" }, "<C-w>k", function() navigate('k') end, { silent = true })
vim.keymap.set({ "n", "t" }, "<C-w>j", function() navigate('j') end, { silent = true })
