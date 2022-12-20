require('gitsigns').setup()

-- remap q to leave fugitive window
local fugitive_augroup = vim.api.nvim_create_augroup("FugitiveGroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.keymap.set('n', 'q', '<C-w>q', { buffer = bufnr, remap = false })
  end,
  pattern = 'fugitive',
  group = fugitive_augroup,
})

vim.keymap.set('n', '<leader>gg', '<CMD>G<CR>', {})
vim.keymap.set('n', '<leader>ga', '<cmd>!git fetch --all<CR>', {})
