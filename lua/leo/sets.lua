vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true

-- vim.o.guicursor = ""
vim.o.hidden = true

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.showmatch = true


-- Tabs and spaces
vim.o.tabstop = 2 
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- Wrap is hard
vim.o.wrap = false

-- Turn off the bell, please
vim.o.belloff = "all"

-- Nop
vim.o.swapfile = false
vim.o.backup = false
vim.api.nvim_command("set undodir=~/.config/nvim/undodir")
vim.o.undofile = true
vim.o.scrolloff = 8
vim.o.showmode = false

vim.o.cursorline = true
vim.o.cmdheight = 2
vim.o.updatetime = 1000
vim.o.termguicolors = true
vim.api.nvim_command("set signcolumn=yes")
vim.api.nvim_command("set colorcolumn=80")
vim.o.completeopt = "menuone,noselect"
vim.api.nvim_command("set noshowmode")
vim.api.nvim_command("set shortmess+=c")

vim.o.mouse = "a"
