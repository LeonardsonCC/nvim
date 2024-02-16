return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    require('treesitter-context').setup({
      enable = true,
      max_lines = 5,
    })
    vim.cmd([[hi TreesitterContext guibg=#222222]])
  end,
}
