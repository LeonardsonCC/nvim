-- Escape
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true })

-- Ctrl Backspace to delete word
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-\\><C-o>db", { noremap = true })

-- Source current file
vim.api.nvim_set_keymap("n", "<Leader><Enter>", ":source $MYVIMRC<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>c<Enter>", ":source %<CR>", { noremap = true })

-- Clipboard 
vim.api.nvim_set_keymap("v", "<Leader>P", '"_dP', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>Y", 'gg"+yG', { noremap = true })

-- FuGITive
vim.api.nvim_set_keymap("n", "<Leader>gg", ":Git<CR>", { noremap = true })

-- Terminal
vim.api.nvim_set_keymap("n", "<Leader>t", ":Ttoggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "kj", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Buffer
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bd<CR>", { noremap = true })

-- NvimTree
vim.api.nvim_set_keymap("n", "<Leader>op", ":NvimTreeFindFileToggle<CR>", { noremap = true })

-- Symbols Outline
vim.api.nvim_set_keymap("n", "<leader>st", ":SymbolsOutline<CR>", {})

-- Telekasten
vim.api.nvim_set_keymap("n", "<leader>n", ":Telekasten<CR>", {})

