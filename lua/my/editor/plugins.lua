local packer = require('packer')

packer.use('nvim-treesitter/nvim-treesitter', {
  run = ':TSUpdate',
})
packer.use('nvim-treesitter/nvim-treesitter-context')
packer.use('gpanders/editorconfig.nvim')

packer.use('folke/which-key.nvim')

packer.use('norcalli/nvim-colorizer.lua')

packer.use('nvim-lualine/lualine.nvim')
packer.use('arkav/lualine-lsp-progress')

packer.use({
  'folke/todo-comments.nvim',
  requires = 'nvim-lua/plenary.nvim',
})

packer.use('lukas-reineke/indent-blankline.nvim')
packer.use('RRethy/vim-illuminate')
packer.use('rainbowhxch/beacon.nvim')
packer.use('numToStr/Comment.nvim')
packer.use('folke/tokyonight.nvim')
packer.use('marko-cerovac/material.nvim')
packer.use({
  "catppuccin/nvim",
  as = "catppuccin",
})

packer.use({
  'folke/trouble.nvim',
  require = 'kyazdani42/nvim-web-devicons',
})
packer.use('NMAC427/guess-indent.nvim')
