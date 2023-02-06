return {
  "numToStr/Comment.nvim",
  lazy = true,
  keys = { "<C-_>", "V" },
  cond = not vim.g.vscode,
  config = function()
    require("Comment").setup {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      toggler = {
        line = "<C-_>",
      },
      opleader = {
        line = "<C-_>",
      },
    }
  end,
}
