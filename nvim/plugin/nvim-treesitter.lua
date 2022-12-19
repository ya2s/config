local ok, _ = pcall(require, "nvim-treesitter")
if not ok or vim.g.vscode then
  return
end

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "go",
    "graphql",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "python",
    "prisma",
    "ruby",
    "tsx",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
