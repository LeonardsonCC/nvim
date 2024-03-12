return {
  'elias-gill/makeman',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    vim.keymap.set('n', '<leader>mr', require('makeman').run, { desc = 'Run makefile cmd' })
  end,
  keys = {
    { '<leader>mr' },
  },
}
