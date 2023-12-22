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
}
