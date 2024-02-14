return {
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>tf', '<cmd>Oil<cr>', desc = '[T]oggle [F]iletree' },
    },
  },
}
