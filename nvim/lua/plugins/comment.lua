local M = {
  "numToStr/Comment.nvim",
  lazy = true,
  keys = "<C-_>",
  cond = not vim.g.vscode,
}

function M.config()
  require("Comment").setup {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    toggler = {
      line = "<C-_>",
    },
    opleader = {
      line = "<C-_>",
    },
  }
end

return M
