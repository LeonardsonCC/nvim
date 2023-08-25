-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<A-k>", "", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "", { desc = "Move down" })
vim.keymap.set("n", "<A-j>", "", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "", { desc = "Move up" })
