if not vim.g.vscode then
  vim.pack.add({ "https://github.com/dnlhc/glance.nvim" })

  require("glance").setup()
  vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
  vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
  vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
  vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
end
