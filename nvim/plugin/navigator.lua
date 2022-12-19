local ok, _ = pcall(require, "Navigator")
if not ok or vim.g.vscode then
  return
end

require("Navigator").setup()

vim.keymap.set("n", "<C-w>h", ":NavigatorLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-w>l", ":NavigatorRight<cr>", { silent = true })
vim.keymap.set("n", "<C-w>k", ":NavigatorUp<cr>", { silent = true })
vim.keymap.set("n", "<C-w>j", ":NavigatorDown<cr>", { silent = true })
