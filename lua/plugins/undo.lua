return {
  {
    "kevinhwang91/nvim-fundo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("fundo").install()

      vim.o.undofile = true
      require("fundo").setup()
    end,
    lazy = false,
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
    keys = {
      { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" },
    },
  },
}
