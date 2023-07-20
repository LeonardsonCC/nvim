local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.number = 1

vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set('n', '<Leader>e', '<cmd>Ex<cr>')
vim.keymap.set('n', '<esc>', '<cmd>nohl<cr>')

require("lazy").setup("conf.plugins")

require("conf.plugins")
require("conf.set")
require("conf.lsp")
