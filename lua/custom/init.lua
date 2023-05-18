local autocmd = vim.api.nvim_create_autocmd

require('custom.fugitive')

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Autosave files
autocmd("BufWritePre", {
  pattern = "*.go",
  command = "lua vim.lsp.buf.format { async = true }",
})
