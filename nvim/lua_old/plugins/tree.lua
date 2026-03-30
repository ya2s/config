local M = {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  event = "BufEnter",
  -- keys = "<C-e>",
  -- dependencies = {
  -- { "ahmedkhalf/project.nvim" },
  -- },
}

function M.init()
  vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function(ctx)
      -- Go to root on startup
      local root = vim.fs.root(ctx.buf, { ".git" })
      if root then
        vim.uv.chdir(root)
      end
    end,
  })
end

function M.config()
  local nonicons_extention = require "nvim-nonicons.extentions.nvim-tree"

  -- vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#24292e" })

  vim.keymap.set("n", "<C-e>", require("nvim-tree.api").tree.toggle, { silent = true })

  vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function(ctx)
      -- Auto close on close
      if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
        vim.cmd "quit"
      end
    end,
  })

  local function on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { buffer = bufnr })
  end

  require("nvim-tree").setup {
    on_attach = on_attach,
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

  -- require("project_nvim").setup {}
end

return M
