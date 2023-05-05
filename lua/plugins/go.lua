return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
    },
    opts = function()
      require("go").setup({})
    end,
    keys = function ()
      return {
        {"<Leader>cgtt", "<cmd>GoTest -F<CR>", desc = "Run Go tests" },
        {"<Leader>cgtf", "<cmd>GoTestFile -F<CR>", desc = "Run Go file test" },
        {"<Leader>cgtF", "<cmd>GoTestFunc -F<CR>", desc = "Run Go func test" },
        {"<Leader>cgD", "<cmd>GoDoc<CR>", desc = "Run Go func test" },
        {"<Leader>cgo", "<cmd>GoPkgOutline<CR>", desc = "Open pkg outline"},
        {"<Leader>cgTa", "<cmd>GoAddTag<CR>", desc = "Add tags"},
        {"<Leader>cgTr", "<cmd>GoRmTag<CR>", desc = "Remove tags"},
        {"go", "<cmd>GoAlt<CR>", desc = "Go to test/back to code", noremap = true},
      }
    end
  },
  {
    "LeonardsonCC/nvim-goc.lua",
    init = function()
      require("nvim-goc").setup()
    end,
    keys = function ()
      local goc = require("nvim-goc")
      return {
        {"<Leader>cgtc", goc.ToggleCoverage, desc = "Code coverage" }
      }
    end
  },
}
