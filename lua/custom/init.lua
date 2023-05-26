local autocmd = vim.api.nvim_create_autocmd
local addft = require "custom.nice-functions.add-to-filetype"

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Autoformat go files
autocmd("BufWritePre", {
  pattern = { "*.go", "*.lua" },
  command = "lua vim.lsp.buf.format { async = false }",
})
-- format json files using jq
autocmd("FileType", {
  pattern = "json",
  command = 'lua vim.keymap.set("n", "<leader>fm", "<cmd>%!jq .<cr>", { noremap = false })',
})

autocmd("FileType", {
  pattern = { "fugitive", "spectre_panel" },
  command = addft.qKeymap,
})

-- Leap backdrop
vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#777777" })

vim.o.scrolloff = 10
vim.opt.guicursor = ""
