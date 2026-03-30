if vim.g.vscode then return end

vim.pack.add({ 'https://github.com/projekt0n/github-nvim-theme' })

vim.cmd "colorscheme github_dark_dimmed"
vim.api.nvim_set_hl(0, 'StatusLine', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { link = 'Normal' })
