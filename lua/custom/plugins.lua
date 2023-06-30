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
  {
    "LeonardsonCC/nvim-goc.lua",
    config = function()
      require("nvim-goc").setup { verticalSplit = false }
      -- creates a command to remap just in mappings
      vim.api.nvim_create_user_command("GoCoc", require("nvim-goc").ToggleCoverage, {})
    end,
    ft = { "go", "gomod" },
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Open Trouble" } },
    },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
  },
  {
    "folke/zen-mode.nvim",
    opts = {},
    lazy = false,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    opts = function()
      require("lsp_lines").setup()
    end,
    lazy = false,
  },
}

return plugins
