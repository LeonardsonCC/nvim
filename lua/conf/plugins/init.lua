return {
  { "folke/which-key.nvim", opts = {} },
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",
  "nvim-treesitter/nvim-treesitter",
  {
    "max397574/better-escape.nvim",
    init = function()
      require("better_escape").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
}
