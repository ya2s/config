local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "dnlhc/glance.nvim", config = true },
  },
  lazy = true,
  event = "BufReadPre",
  cond = not vim.g.vscode,
}

function M.config()
  local lspconfig = require "lspconfig"
  local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, silent = true }
    -- back ctrl-o
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  local servers = { "rust_analyzer", "prismals" }
  for _, server in ipairs(servers) do
    lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  lspconfig["denols"].setup {
    root_dir = lspconfig.util.root_pattern "deno.json",
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      lint = true,
      unstable = true,
      suggest = {
        imports = {
          hosts = {
            ["https://deno.land"] = true,
            ["https://cdn.nest.land"] = true,
            ["https://crux.land"] = true,
          },
        },
      },
    },
  }

  lspconfig["tsserver"].setup {
    root_dir = lspconfig.util.root_pattern "package.json",
    on_attach = on_attach,
    capabilities = capabilities,
  }

  lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  }

  vim.fn.sign_define(
    "DiagnosticSignError",
    { text = "", texthl = "", linehl = "", numhl = "LspDiagnosticsVirtualTextError" }
  )
  vim.fn.sign_define(
    "DiagnosticSignWarn",
    { text = "", texthl = "", linehl = "", numhl = "LspDiagnosticsVirtualTextWarning" }
  )
  vim.fn.sign_define(
    "DiagnosticSignInfo",
    { text = "", texthl = "", linehl = "", numhl = "LspDiagnosticsVirtualTextInformation" }
  )
  vim.fn.sign_define(
    "DiagnosticSignHint",
    { text = "", texthl = "", linehl = "", numhl = "LspDiagnosticsVirtualTextHint" }
  )

  -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = "red", underline = true })

  vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
    end,
  })

  vim.diagnostic.config {
    virtual_text = false,
    -- signs = false,
    -- underline = false,
    float = {
      border = "rounded",
    },
  }

  require("plugins.null-ls").config()

  vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
  vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
  vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
  vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
end

return M
