local ok, _ = pcall(require, "nvim-nonicons")
if not ok or vim.g.vscode then
  return
end

require("nvim-nonicons").setup()
