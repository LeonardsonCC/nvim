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
  {
    "rcarriga/nvim-notify",
    enabled = false,
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
}
