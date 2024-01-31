return {
  'folke/zen-mode.nvim',
  config = function()
    vim.keymap.set('n', '<leader>zz', function()
      require('zen-mode').setup({
        window = {
          options = {},
        },
      })
      require('zen-mode').toggle()
      vim.wo.wrap = false
    end)

    vim.keymap.set('n', '<leader>zZ', function()
      require('zen-mode').setup({
        window = {
          options = {},
        },
      })
      require('zen-mode').toggle()
      vim.wo.wrap = false
    end)
  end,
}
