local ok, _ = pcall(require, "nvim-cursorline")
if not ok or vim.g.vscode then
  return
end

require("nvim-cursorline").setup()
