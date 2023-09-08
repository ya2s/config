local M = {
  "nvim-lualine/lualine.nvim",
  cond = not vim.g.vscode,
}

function M.config()
  local icons = require "nvim-nonicons"
  local colors = {
    black = "#23292e",
    white = "#666666",
  }
  local component = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  }

  local custom_theme = {
    alt_bg = component,
    normal = component,
    insert = component,
    command = component,
    visual = component,
    replace = component,
    terminal = component,
  }

  require("lualine").setup {
    options = { theme = custom_theme },
    sections = {
      -- lualine_a = { nonicons_extention.mode },
      lualine_a = {},
      lualine_b = {
        {
          "filename",
          path = 1,
        },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        {
          "branch",
          icon = icons.get "git-branch",
        },
      },
    },
  }
end

return M
