if vim.g.vscode then return end

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
})

require("telescope").setup({
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    prompt_prefix = "   ",
    selection_caret = " ❯ ",
    entry_prefix = "   ",
    sorting_strategy = "ascending",
    winblend = 20,
  },
})

vim.keymap.set("n", "<leader>p", function() require("telescope.builtin").git_files() end, { silent = true })
vim.keymap.set("n", "<leader>f", function() require("telescope.builtin").live_grep() end, { silent = true })
