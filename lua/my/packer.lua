return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'folke/tokyonight.nvim'
  use 'marko-cerovac/material.nvim'
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }

  -- telescope is great
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup()
    end,
  }
  use {
    'folke/trouble.nvim',
    require = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {
        icons = true,
      }
    end,
  }

  -- undotree is cool
  use 'mbbill/undotree'

  -- better code
  use('nvim-treesitter/nvim-treesitter', {
    run = ':TSUpdate',
  })
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'gpanders/editorconfig.nvim'

  -- better go code
  use {
    'ray-x/go.nvim',
    config = function()
      require('go').setup {}
    end,
  }

  -- i'm too lazy to comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  -- just because it's fancy
  use 'j-hui/fidget.nvim'

  -- beauty
  use 'nvim-lualine/lualine.nvim'
  use 'arkav/lualine-lsp-progress'

  -- use {
  --   'nvim-tree/nvim-tree.lua',
  --   requires = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  -- }

  use 'folke/which-key.nvim'

  use 'ThePrimeagen/harpoon'

  use 'rainbowhxch/beacon.nvim'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }

  use 'NMAC427/guess-indent.nvim'

  -- use '~/dev/scrips.nvim'

  use {
    "LeonardsonCC/scrips.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  use 'shortcuts/no-neck-pain.nvim'
  use 'dstein64/vim-startuptime'
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({})
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
end)
