if vim.g.vscode then return end

vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function(ctx)
    local root = vim.fs.root(ctx.buf, { ".git" })
    if root then
      vim.uv.chdir(root)
    end
  end,
})

vim.keymap.set("n", "<C-e>", function() require("nvim-tree.api").tree.toggle() end, { silent = true })

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd("quit")
    end
  end,
})

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { buffer = bufnr })
end

require("nvim-tree").setup({
  on_attach = on_attach,
  tab = {
    sync = { open = true },
  },
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  git = {
    enable = false,
  },
  renderer = {
    root_folder_label = ":t",
    icons = {
      padding = "  ",
    },
    indent_markers = {
      enable = true,
    },
  },
})
