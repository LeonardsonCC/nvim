return {
  "ruifm/gitlinker.nvim",
  opts = {},
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    {
      "<leader>gy",
      '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',
      desc = "[G]it [Y]ank link",
    },
  },
}
