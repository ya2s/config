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
    dir = "/Users/yamatsum/.ghq/github.com/ya2s/nvim-cursorline",
    name = "nvim-cursorline",
    config = true,
  },
  -- { "yamatsum/nvim-cursorline", config = true },
  {
    "vimpostor/vim-tpipeline",
    lazy = true,
    event = "BufEnter",
    config = function()
      vim.g.tpipeline_autoembed = 0
    end,
  },
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
  {
    'dnlhc/glance.nvim',
    cmd = 'Glance',
    config = function()
      vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
      vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
      vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
      vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
    end
  }

}
