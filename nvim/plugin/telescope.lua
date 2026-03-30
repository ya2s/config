if vim.g.vscode then return end

local telescope_loaded = false
local function ensure_telescope()
  if telescope_loaded then return end
  telescope_loaded = true

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
end

vim.keymap.set("n", "<leader>p", function()
  ensure_telescope()
  require("telescope.builtin").git_files()
end, { silent = true })

vim.keymap.set("n", "<leader>f", function()
  ensure_telescope()
  require("telescope.builtin").live_grep()
end, { silent = true })
