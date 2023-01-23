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
    "gbprod/yanky.nvim",
    opts = function()
      require("yanky").setup({})
      require("telescope").load_extension("yank_history")
    end,
  },
}
