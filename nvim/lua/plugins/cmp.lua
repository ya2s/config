local M = {
  "hrsh7th/nvim-cmp",
  cond = not vim.g.vscode,
  event = "BufEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/vim-vsnip",
  },
}

function M.config()
  local cmp = require "cmp"

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    sources = {
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
    },
  }

  cmp.setup.cmdline(":", {
    formatting = {
      fields = { "abbr" },
    },
    completion = {
      keyword_length = 3,
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  cmp.setup.cmdline("/", {
    formatting = {
      fields = { "abbr" },
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })
end

return M
