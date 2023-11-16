return {
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "yamatsum/nvim-nonicons",
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
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
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    event = "BufEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = true,
  },
  { "yamatsum/nvim-cursorline", config = true },
  {
    "Akianonymus/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        mode = "virtualtext",
        virtualtext = "⚫︎",
      },
    },
  },
  {
    "vimpostor/vim-tpipeline",
    lazy = true,
    event = "BufEnter",
    config = function()
      vim.g.tpipeline_autoembed = 0
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    priority = 1000,
    config = function()
      -- require("github-theme").setup {}
      vim.cmd "colorscheme github_dark_dimmed"
    end,
  },
  { "kylechui/nvim-surround", config = true, cond = true },
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
  },
}
