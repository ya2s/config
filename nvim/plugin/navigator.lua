if not vim.g.vscode then
  vim.pack.add({ "https://github.com/numToStr/Navigator.nvim" })

  local nav = require("Navigator")
  nav.setup()
  vim.keymap.set({ "n", "t" }, "<C-h>", nav.left, { silent = true })
  vim.keymap.set({ "n", "t" }, "<C-l>", nav.right, { silent = true })
  vim.keymap.set({ "n", "t" }, "<C-k>", nav.up, { silent = true })
  vim.keymap.set({ "n", "t" }, "<C-j>", nav.down, { silent = true })
end
