return {
  "phaazon/hop.nvim",
  branch = "v2",
  lazy = true,
  keys = "s",
  config = true,
  init = function()
    vim.keymap.set("n", "s", require("hop").hint_words, { silent = true })
  end,
}
