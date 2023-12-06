return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    keys = {
      { ",gf", "<cmd>GoTestFile<CR>", desc = "Go Test File" },
      { ",gp", "<cmd>GoTestPkg<CR>", desc = "Go Test Package" },
      { ",gp", "<cmd>GoTestPkg<CR>", desc = "Go Test Package" },
    },
  },
  {
    "LeonardsonCC/nvim-goc.lua",
    event = { "VeryLazy" },
    config = function()
      local goc = require("nvim-goc")
      goc.setup({ verticalSplit = false })

      vim.keymap.set("n", ",gc", goc.ToggleCoverage, { silent = true, desc = "Go Code Coverage" })
    end,
  },
}
