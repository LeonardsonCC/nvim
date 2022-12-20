return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = {
      { 'nvim-lua/plenary.nvim' }
    },
  },
  'mbbill/undotree',
  'ThePrimeagen/harpoon',
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
}
