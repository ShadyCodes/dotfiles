-- This if so that the new line isn't a comment.
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.expandtab = false
vim.opt.tabstop = 6
vim.opt.shiftwidth = 6
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.autoindent = true

vim.opt.guifont = "JetBrainsMono Nerd Font"
vim.opt.undofile = true
vim.g.nvimtree_side = "right"
vim.opt.confirm = true
