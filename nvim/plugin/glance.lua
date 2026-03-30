if vim.g.vscode then return end

local glance_loaded = false
local function ensure_glance()
  if glance_loaded then return end
  glance_loaded = true
  vim.pack.add({ "https://github.com/dnlhc/glance.nvim" })
  require("glance").setup()
end

vim.keymap.set("n", "gD", function() ensure_glance() vim.cmd("Glance definitions") end)
vim.keymap.set("n", "gR", function() ensure_glance() vim.cmd("Glance references") end)
vim.keymap.set("n", "gY", function() ensure_glance() vim.cmd("Glance type_definitions") end)
vim.keymap.set("n", "gM", function() ensure_glance() vim.cmd("Glance implementations") end)
