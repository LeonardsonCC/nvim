-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<A-k>", "", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "", { desc = "Move down" })
vim.keymap.set("n", "<A-j>", "", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "", { desc = "Move up" })
vim.keymap.set("v", "<A-k>", "", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", "", { desc = "Move down" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Terminal mode
-- vim.keymap.set("t", "<esc>", "<C-\\><C-N>", { silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-N>", { silent = true })
vim.keymap.set("t", "kj", "<C-\\><C-N>", { silent = true })
