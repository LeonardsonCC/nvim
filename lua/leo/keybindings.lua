-- Escape
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true })

-- Source current file
vim.api.nvim_set_keymap("n", "<Leader><Enter>", ":source $MYVIMRC<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>c<Enter>", ":source %<CR>", { noremap = true })

-- Clipboard 
vim.api.nvim_set_keymap("v", "<Leader>P", '"_dP', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>Y", 'gg"+yG', { noremap = true })

-- FuGITive
vim.api.nvim_set_keymap("n", "<Leader>gs", ":Git<CR>", { noremap = true })

-- Terminal
vim.api.nvim_set_keymap("n", "<Leader>t", ":Ttoggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "kj", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Buffer
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bd<CR>", { noremap = true })

-- NvimTree
vim.api.nvim_set_keymap("n", "<Leader>fc", ":NvimTreeFindFileToggle<CR>", { noremap = true })

-- Comments
vim.api.nvim_set_keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
vim.api.nvim_set_keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
vim.api.nvim_set_keymap("x", "<leader>ci", "<Plug>kommentary_visual_increase", {})
vim.api.nvim_set_keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
vim.api.nvim_set_keymap("x", "<leader>cd", "<Plug>kommentary_visual_decrease", {})

-- Rest Client
vim.api.nvim_set_keymap("n", "<leader>rr", "<Plug>RestNvim", {})
vim.api.nvim_set_keymap("n", "<leader>rp", "<Plug>RestNvimPreview", {})
vim.api.nvim_set_keymap("n", "<leader>rl", "<Plug>RestNvimLast", {})

-- Symbols Outline
vim.api.nvim_set_keymap("n", "<leader>st", ":SymbolsOutline<CR>", {})
