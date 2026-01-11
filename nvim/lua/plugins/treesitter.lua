return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- local tree_sitter_filetypes = {
    -- "json",
    -- "lua",
    -- "typescript",
    -- "tsx",
    -- }

    -- require('nvim-treesitter').install(tree_sitter_filetypes):wait(300000)
    -- vim.api.nvim_create_autocmd('FileType', {
    -- pattern = tree_sitter_filetypes,
    -- callback = function() vim.treesitter.start() end,
    -- })
  end,
}
