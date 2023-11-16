return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "go",
        "graphql",
        "help",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "python",
        "prisma",
        "ruby",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      highlight = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    }
  end,
}
