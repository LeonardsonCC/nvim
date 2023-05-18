local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "ggandor/flit.nvim",
    dependencies = {
      {
        "ggandor/leap.nvim",
      },
    },
    config = function()
      require("flit").setup {
        keys = { f = "f", F = "F", t = "t", T = "T" },
        labeled_modes = "nvx",
        multiline = true,
        opts = {},
      }
    end,
    lazy = false,
  },
  {
    "nvim-pack/nvim-spectre",
    keys = {
      { "<leader>S", '<cmd>lua require("spectre").open()<CR>', { desc = "Open Spectre" } },
      {
        "<leader>sw",
        '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
        { desc = "Search current word" },
      },
      {
        "<leader>sp",
        '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
        { desc = "Search on current file" },
      },
    },
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
