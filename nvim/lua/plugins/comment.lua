return {
  "numToStr/Comment.nvim",
  lazy = true,
  keys = { "<C-_>", "V" },
  opts = {
    pre_hook = function()
      return vim.bo.commentstring
    end,
    toggler = {
      line = "<C-_>",
    },
    opleader = {
      line = "<C-_>",
    },
  },
}
