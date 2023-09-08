return {
  "numToStr/Comment.nvim",
  lazy = true,
  keys = { "<C-_>", "V" },
  cond = not vim.g.vscode,
  opts = {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    toggler = {
      line = "<C-_>",
    },
    opleader = {
      line = "<C-_>",
    },
  },
}
