return {
  'danymat/neogen',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  opts = {},
  keys = {
    { 'cd', '<cmd>lua require("neogen").generate()<cr>', desc = '[C]ode [D]ocumentation' },
  },
}
