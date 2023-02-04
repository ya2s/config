local M = {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  keys = " ",
  cond = not vim.g.vscode,
}

function M.config()
  local map = vim.keymap.set

  require("telescope").setup {
    defaults = {
      layout_config = {
        prompt_position = "top",
      },
      prompt_prefix = "    ",
      selection_caret = " ❯ ",
      entry_prefix = "   ",
      sorting_strategy = "ascending",
      winblend = 20,
    },
  }

  map("", "<leader>p", require("telescope.builtin").git_files, { silent = true })
  map("", "<leader>f", require("telescope.builtin").live_grep, { silent = true })
end

return M
