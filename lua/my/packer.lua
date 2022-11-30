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

  -- snippets
  use 'L3MON4D3/LuaSnip'

  -- LSP things
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',
  }
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim', -- nice icons
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({})
    end,
  }


  use 'gbrlsnchs/telescope-lsp-handlers.nvim'
  -- use {
  --   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  --   config = function()
  --     require('lsp_lines').setup()
  --   end,
  -- }

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

  -- trying different things
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
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
  use {
    'edolphin-ydf/goimpl.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
    config = function()
      require('telescope').load_extension 'goimpl'
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

  use 'SidOfc/carbon.nvim'

  use 'folke/which-key.nvim'
  -- use {
  --   'folke/noice.nvim',
  --   event = 'VimEnter',
  --   config = function()
  --     require('noice').setup {
  --       messages = {
  --         enabled = false,
  --       },
  --     }
  --   end,
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     'MunifTanjim/nui.nvim',
  --     'rcarriga/nvim-notify',
  --   },
  -- }

  use 'ThePrimeagen/harpoon'

  use 'rainbowhxch/beacon.nvim'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }
end)
