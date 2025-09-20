return {
  { "neovim/nvim-lspconfig" },
  { "nvim-lua/plenary.nvim",    lazy = true },
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
    config = function()
      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function(filetype, option)
        return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
            or get_option(filetype, option)
      end
      vim.keymap.set({ "n", "v" }, "<C-_>", ":normal gcc<CR>")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
    },
  },
  { "yamatsum/nvim-cursorline", config = true },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      render = "virtual",
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
