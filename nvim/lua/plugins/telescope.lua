return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  keys = " ",
  cond = not vim.g.vscode,
  opts = {
    defaults = {
      layout_config = {
        prompt_position = "top",
      },
      prompt_prefix = "   ",
      selection_caret = " ❯ ",
      entry_prefix = "   ",
      sorting_strategy = "ascending",
      winblend = 20,
    },
  },
  init = function()
    if not vim.g.vscode then
      vim.keymap.set("", "<leader>p", require("telescope.builtin").git_files, { silent = true })
      vim.keymap.set("", "<leader>f", require("telescope.builtin").live_grep, { silent = true })
    end
  end,
}
