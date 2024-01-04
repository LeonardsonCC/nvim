return {
  {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup()
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    opts = {
      mappings = {
        toggle = 'gs',
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    'norcalli/nvim-colorizer.lua',
    opts = {
      'css',
      'javascript',
      'lua',
      html = {
        mode = 'foreground',
      },
    },
  },
  {
    'gpanders/editorconfig.nvim',
  },
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
  {
    'nvim-pack/nvim-spectre',
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
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'NStefan002/visual-surround.nvim',
    opts = {},
  },
}
