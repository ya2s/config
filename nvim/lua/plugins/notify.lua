local M = {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  cond = not vim.g.vscode,
}

function M.config()
  local nonicons_extention = require "nvim-nonicons.extentions.nvim-notify"

  require("notify").setup {
    icons = nonicons_extention.icons,
  }

  vim.notify = require "notify"
end

return M
