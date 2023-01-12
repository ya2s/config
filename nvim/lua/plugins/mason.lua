local M = {
  "williamboman/mason.nvim",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim", lazy = true },
  },
  cond = not vim.g.vscode,
}

function M.config()
  require("mason").setup()
  require("mason-lspconfig").setup {
    ensure_installed = { "rust_analyzer", "tsserver", "denols", "sumneko_lua" },
    automatic_installation = true,
  }
end

return M
