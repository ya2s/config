if not vim.g.vscode then
  vim.pack.add({ 'https://github.com/windwp/nvim-autopairs' })
  
  require("nvim-autopairs").setup()
end

