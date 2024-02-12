return {
  'nvim-treesitter/nvim-treesitter-context',
  opts = {},
  config = function()
    vim.cmd([[hi TreesitterContext guibg=#222222]])
  end,
}
