local M = {
  "phaazon/hop.nvim",
  branch = "v2",
  lazy = true,
  keys = "s",
}

function M.config()
  require("hop").setup {}
  vim.keymap.set("n", "s", require("hop").hint_words, { silent = true })
end

return M
