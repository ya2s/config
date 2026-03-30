if vim.g.vscode then return end

vim.schedule(function()
  vim.pack.add({ "https://github.com/rcarriga/nvim-notify" })
  require("notify").setup()
  vim.notify = require("notify")
end)
