-- Terminal
vim.keymap.set('t', 'jk', '<C-\\><c-n>', { desc = 'quit terminal mode' })

return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({
        size = 20,
        open_mapping = [[<c-\>]],
      })

      vim.keymap.set('n', '<c-x>', function()
        local cmd = vim.fn.input('Command: ')
        if cmd ~= '' then
          vim.cmd('TermExec cmd="' .. cmd .. '"')
        end
      end, { desc = 'Terminal exec' })
    end,
  },
}
