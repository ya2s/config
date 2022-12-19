local ok, _ = pcall(require, "hop")
if not ok then
  return
end

require("hop").setup()

vim.keymap.set("n", "s", require("hop").hint_words, { silent = true })
