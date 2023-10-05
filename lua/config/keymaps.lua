-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<A-k>", "", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "", { desc = "Move down" })
vim.keymap.set("n", "<A-j>", "", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "", { desc = "Move up" })
vim.keymap.set("v", "<A-k>", "", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", "", { desc = "Move down" })

vim.keymap.set("n", "<leader>gg", "<CMD>Neogit<CR>", { desc = "Move down" })
vim.keymap.set("n", "<leader>gG", "<CMD>Neogit<CR>", { desc = "Move down" })

vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })
