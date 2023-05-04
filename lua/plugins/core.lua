return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {},
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      splitbelow = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },
  {
    "gbprod/yanky.nvim",
    opts = function()
      require("yanky").setup({})
      require("telescope").load_extension("yank_history")
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = function()
      vim.cmd([[ highlight NotifyBackground guibg=#000000 ]])
      return {}
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fF",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = true,
          })
        end,
        desc = "Find Plugin File",
      },
    },
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   opts = function()
  --     require("chatgpt").setup({
  --       -- optional configuration
  --     })
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
}
