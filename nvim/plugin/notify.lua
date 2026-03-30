if not vim.g.vscode then
  vim.pack.add({ "https://github.com/rcarriga/nvim-notify" })

  require("notify").setup()
  vim.notify = require("notify")
end
