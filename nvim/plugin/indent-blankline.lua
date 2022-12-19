local ok, _ = pcall(require, "indent_blankline")
if not ok or vim.g.vscode then
  return
end

require("indent_blankline").setup()
