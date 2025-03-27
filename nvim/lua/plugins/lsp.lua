local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "dnlhc/glance.nvim", config = true },
  },
  lazy = true,
  event = "BufReadPre",
}

function M.config()
  local lspconfig = require "lspconfig"
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  local servers = { "ts_ls" }
  for _, server in ipairs(servers) do
    lspconfig[server].setup {
      capabilities = capabilities,
    }
  end

  lspconfig.lua_ls.setup {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
          version = "LuaJIT",
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
          },
        },
      })
    end,
    capabilities = capabilities,
  }

  require("plugins.null-ls").config()

  vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
  vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
  vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
  vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")

  ------------------
  -- diagnostic
  ------------------

  vim.diagnostic.config {
    virtual_text = false,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = "DiffDelete",
        [vim.diagnostic.severity.WARN] = "DiffChange",
        [vim.diagnostic.severity.INFO] = "DiffAdd",
      },
    },
    float = {
      border = "rounded",
    },
  }

  vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
    end,
  })
end

return M
