-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- FzfLua
-- map("n", "<Leader>ff", require("fzf-lua").git_files)
-- map("n", "<Leader>fF", require("fzf-lua").files)
-- map("n", "<Leader><Leader>", require("fzf-lua").git_files)
-- map("n", "<Leader>sg", require("fzf-lua").grep_project)
-- map("n", "<Leader>sd", require("fzf-lua").diagnostics_workspace)

-- Escape
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

-- Center when moving around
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- better indent
map("v", ">", ">gv")
map("v", "<", "<gv")

-- better copy and paste from clipboard
map("v", "<Leader>y", '"+y')
map("v", "<Leader>yy", '"+yy')

-- yanky
map("n", "<c-n>", "<Plug>(YankyCycleForward)")
map("n", "<c-p>", "<Plug>(YankyCycleBackward)")
map("n", "<Leader>p", ":Telescope yank_history<CR>")
map("n", "<c-y>", ":Telescope yank_history<CR>")
map("i", "<c-y>", ":Telescope yank_history<CR>")

-- idk why but it is using ESC instead of ALT
map("n", "<A-j>", "", { desc = "Move down" })
map("v", "<A-j>", "", { desc = "Move down" })
map("i", "<A-j>", "", { desc = "Move down" })
map("n", "<A-k>", "", { desc = "Move up" })
map("v", "<A-k>", "", { desc = "Move up" })
map("i", "<A-k>", "", { desc = "Move up" })
