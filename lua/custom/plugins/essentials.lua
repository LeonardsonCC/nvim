return {
  {
    'numtostr/BufOnly.nvim',
    cmd = 'BufOnly',
    keys = {
      { '<leader>bd', '<cmd>BufOnly<cr>', desc = '[B]uffers [D]elete all' },
    },
  },
  {
    'max397574/better-escape.nvim',
    event = 'InsertCharPre',
    opts = {},
  },
}
