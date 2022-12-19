local packer = require('packer')

packer.use('LeonardsonCC/duck.nvim')
packer.use({
  "jackMort/ChatGPT.nvim",
  requires = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  }
})

packer.use({
  "LeonardsonCC/scrips.nvim",
  requires = "nvim-lua/plenary.nvim"
})
