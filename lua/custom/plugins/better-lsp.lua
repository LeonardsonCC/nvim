return {
  {
    'nvimdev/lspsaga.nvim',
    opts = {
      symbol_in_winbar = {
        enable = false,
      },
      definition = {
        keys = {
          edit = '<cr>',
          vsplit = '<c-v>',
          split = '<c-s>',
        },
      },
      finder = {
        keys = {
          toggle_or_open = '<cr>',
          vsplit = '<c-v>',
          split = '<c-s>',
        },
      },
      callhierarchy = {
        keys = {
          edit = '<cr>',
          vsplit = '<c-v>',
          split = '<c-s>',
        },
      },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
