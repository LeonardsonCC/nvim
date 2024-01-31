return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      '<leader>Sp',
      '<cmd>lua require("spectre").open_visual()<CR>',
      desc = '[S]earch and Replace in [P]roject',
    },
    {
      '<leader>Sw',
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      desc = '[S]earch and Replace in [W]ord',
    },
    {
      '<leader>Sf',
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      desc = '[S]earch and Replace in [F]ile',
    },
  },
}
