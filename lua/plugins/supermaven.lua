return {
  {
    "supermaven-inc/supermaven-nvim",
    cond = false,
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
}
