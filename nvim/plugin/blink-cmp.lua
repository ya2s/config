if not vim.g.vscode then
  vim.pack.add({ "https://github.com/saghen/blink.cmp" })

  require("blink.cmp").setup({
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = { auto_show = false },
      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function(ctx) return '' end
            }
          }
        }
      }
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "lua" },
    cmdline = {
      completion = { menu = { auto_show = true } },
    }
  })
end
