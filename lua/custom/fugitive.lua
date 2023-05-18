local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "fugitive",
  command = 'lua vim.keymap.set("n", "q", "<cmd>q<CR>")',
})
