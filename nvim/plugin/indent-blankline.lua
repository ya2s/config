if not vim.g.vscode then
  vim.pack.add({ 'https://github.com/lukas-reineke/indent-blankline.nvim' })

  require("ibl").setup({
    indent = {
      char = "▏",
    },
    scope = { enabled = false },
  })
end