vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.ignorecase = true

vim.opt.smartindent = true

vim.o.belloff = 'all'
vim.o.swapfile = false
vim.o.backup = false
vim.api.nvim_command 'set undodir=~/.config/nvim/undodir'
vim.o.undofile = true

vim.o.scrolloff = 10
vim.o.cursorline = false

vim.api.nvim_command 'set signcolumn=yes'
vim.o.completeopt = 'menuone,noselect'
vim.api.nvim_command 'set noshowmode'
vim.api.nvim_command 'set shortmess+=c'

-- yeah, i like wrap
vim.opt.wrap = true

-- idk why, but i like it
vim.opt.mouse = 'a'

vim.g.mapleader = ' '
