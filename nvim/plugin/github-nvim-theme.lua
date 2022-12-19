local ok, _ = pcall(require, "github-theme")
if not ok or vim.g.vscode then
  return
end

require("github-theme").setup {}
