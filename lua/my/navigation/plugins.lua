local packer = require('packer')

packer.use({
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  requires = {
    { 'nvim-lua/plenary.nvim' }
  },
})
packer.use('mbbill/undotree')
packer.use('ThePrimeagen/harpoon')
