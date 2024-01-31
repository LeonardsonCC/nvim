return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    vim.keymap.set('n', '[t', function()
      require('trouble').next({ skip_groups = true, jump = true })
    end)

    vim.keymap.set('n', ']t', function()
      require('trouble').previous({ skip_groups = true, jump = true })
    end)
  end,
  keys = {
    { 'tt', '<cmd>TroubleToggle<cr>', desc = '[T]oggle [T]rouble' },
  },
}
