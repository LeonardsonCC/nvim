return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  'nvim-treesitter/nvim-treesitter-context',
  'gpanders/editorconfig.nvim',

  "akinsho/toggleterm.nvim",

  'folke/which-key.nvim',

  'norcalli/nvim-colorizer.lua',

  'nvim-lualine/lualine.nvim',
  'arkav/lualine-lsp-progress',

  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
  },

  'lukas-reineke/indent-blankline.nvim',
  'RRethy/vim-illuminate',
  'rainbowhxch/beacon.nvim',
  'numToStr/Comment.nvim',
  'folke/tokyonight.nvim',
  'marko-cerovac/material.nvim',
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },

  {
    'folke/trouble.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
  },
  'NMAC427/guess-indent.nvim',
}
