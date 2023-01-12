local M = {
  "numToStr/Navigator.nvim",
  cond = not vim.g.vscode,
}

function M.config()
  require("Navigator").setup {}
  vim.keymap.set("n", "<C-w>h", ":NavigatorLeft<cr>", { silent = true })
  vim.keymap.set("n", "<C-w>l", ":NavigatorRight<cr>", { silent = true })
  vim.keymap.set("n", "<C-w>k", ":NavigatorUp<cr>", { silent = true })
  vim.keymap.set("n", "<C-w>j", ":NavigatorDown<cr>", { silent = true })
end

return M
