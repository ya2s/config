local M = {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  event = "BufEnter",
  -- keys = "<C-e>",
  dependencies = {
    { "ahmedkhalf/project.nvim" },
  },
  cond = not vim.g.vscode,
}

function M.config()
  local nonicons_extention = require "nvim-nonicons.extentions.nvim-tree"

  vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#24292e" })

  vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { silent = true })

  vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
      if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
        vim.cmd "quit"
      end
    end,
  })

  require("nvim-tree").setup {
    tab = {
      sync = { open = true },
    },
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    respect_buf_cwd = true,
    git = {
      enable = false,
    },
    view = {
      mappings = {
        list = {
          { key = "<Tab>", cb = ":tabnext<CR>" },
          { key = "<C-e>", cb = ":NvimTreeToggle<CR>" },
        },
      },
    },
    renderer = {
      root_folder_modifier = ":t",
      -- group_empty = true,
      icons = {
        padding = "  ",
        glyphs = nonicons_extention.glyphs,
      },
      indent_markers = {
        enable = true,
      },
    },
  }

  require("project_nvim").setup {}
end

return M
