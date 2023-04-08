local o = vim.o
local g = vim.g
local map = vim.keymap.set

if g.vscode then
  map("n", "<Tab>", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
  map("n", "<S-Tab>", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
else
  o.number = true
  o.signcolumn = "yes"
  o.expandtab = true
  o.shiftwidth = 2
  o.updatetime = 250
  o.cmdheight = 0
  o.statuscolumn = "%=%l %s%C"

  g.mapleader = " "

  map("n", "<Tab>", "gt")
  map("n", "<S-Tab>", "gT")
end

o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"

map({ "i", "v" }, "<C-j>", "<esc>")

require "plugin"
