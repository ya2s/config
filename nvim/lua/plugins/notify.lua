return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  cond = not vim.g.vscode,
  config = function()
    local nonicons_extention = require "nvim-nonicons.extentions.nvim-notify"

    require("notify").setup {
      icons = nonicons_extention.icons,
    }

    vim.notify = require "notify"
  end,
}
