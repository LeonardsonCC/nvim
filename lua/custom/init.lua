local autocmd = vim.api.nvim_create_autocmd

require "custom.fugitive"

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

-- close spectre
autocmd("FileType", {
  pattern = "spectre_panel",
  command = 'lua vim.keymap.set("n", "q", "<cmd>q<CR>")',
})

-- Leap backdrop
vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#777777" })
