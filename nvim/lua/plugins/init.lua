return {
  { "nvim-lua/plenary.nvim", lazy = true, cond = not vim.g.vscode },
  {
    "yamatsum/nvim-nonicons",
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cond = not vim.g.vscode,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = { "", "" },
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "NvimTree",
            separator = " ",
          },
        },
      },
    },
    cond = not vim.g.vscode,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true, event = "BufEnter", cond = not vim.g.vscode },
  { "lukas-reineke/indent-blankline.nvim", cond = not vim.g.vscode },
  { "yamatsum/nvim-cursorline", config = true, cond = not vim.g.vscode },
  {
    "Akianonymus/nvim-colorizer.lua",
    cond = not vim.g.vscode,
    opts = { user_default_options = {
      mode = "virtualtext",
      virtualtext = "⚫︎",
    } },
  },
  {
    "vimpostor/vim-tpipeline",
    lazy = true,
    event = "BufEnter",
    config = function()
      vim.g.tpipeline_autoembed = 0
    end,
    cond = not vim.g.vscode,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
    event = "BufEnter",
    config = function()
      require("github-theme").setup {}
    end,
    cond = not vim.g.vscode,
  },
  { "kylechui/nvim-surround", config = true },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "" },
        untracked = { text = "▎" },
      },
    },
    cond = not vim.g.vscode,
  },
}
