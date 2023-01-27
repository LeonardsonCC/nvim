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

-- go lsp
map("n", "<Leader>ctt", ":GoTest -F<CR>", {
  desc = "Run Go tests",
})
map("n", "<Leader>ctf", ":GoTestFile -F<CR>", {
  desc = "Run Go file test",
})
map("n", "<Leader>ctF", ":GoTestFunc -F<CR>", {
  desc = "Run Go func test",
})
map("n", "<Leader>cD", ":GoDoc ", {
  desc = "Run Go func test",
})
map("n", "<Leader>co", ":GoPkgOutline<CR>", {
  desc = "Open pkg outline",
})
map("n", "<Leader>cTa", ":GoAddTag<CR>", {
  desc = "Add tags",
})
map("n", "<Leader>cTr", ":GoRmTag<CR>", {
  desc = "Remove tags",
})
map("n", "go", ":GoAlt<CR>", {
  desc = "Go to test/back to code",
  noremap = true,
})

-- idk why but it is using ESC instead of ALT
map("n", "<A-j>", "", { desc = "Move down" })
map("v", "<A-j>", "", { desc = "Move down" })
map("i", "<A-j>", "", { desc = "Move down" })
map("n", "<A-k>", "", { desc = "Move up" })
map("v", "<A-k>", "", { desc = "Move up" })
map("i", "<A-k>", "", { desc = "Move up" })
