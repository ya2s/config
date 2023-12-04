local o = vim.o
local g = vim.g
local map = vim.keymap.set

if g.vscode then
  map("n", "<Tab>", function()
    require("vscode-neovim").call "workbench.action.nextEditor"
  end)
  map("n", "<S-Tab>", function()
    require("vscode-neovim").call "workbench.action.previousEditor"
  end)
else
  o.number = true
  o.signcolumn = "yes"
  o.statuscolumn = "%=%l %s"
  o.expandtab = true
  o.shiftwidth = 2
  o.updatetime = 250
  o.cmdheight = 0

  g.mapleader = " "

  map("n", "<Tab>", "gt")
  map("n", "<S-Tab>", "gT")
end

o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"

map({ "i", "v" }, "<C-j>", "<esc>")

require "plugin"
