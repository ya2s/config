local ok, _ = pcall(require, "project_nvim")
if not ok or vim.g.vscode then
  return
end

require("project_nvim").setup()
