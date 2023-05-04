return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.goimports,

          -- nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {
        {
          "<c-d>",
          function()
            return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
          end,
          expr = true,
          silent = true,
          mode = "i",
        },
        {
          "<c-d>",
          function()
            require("luasnip").jump(1)
          end,
          mode = "s",
        },
        {
          "<c-D>",
          function()
            require("luasnip").jump(-1)
          end,
          mode = { "i", "s" },
        },
      }
    end,
  },
  -- Go
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
        {"<Leader>ctt", "<cmd>GoTest -F<CR>", desc = "Run Go tests" },
        {"<Leader>ctf", "<cmd>GoTestFile -F<CR>", desc = "Run Go file test" },
        {"<Leader>ctF", "<cmd>GoTestFunc -F<CR>", desc = "Run Go func test" },
        {"<Leader>cD", "<cmd>GoDoc ", desc = "Run Go func test" },
        {"<Leader>co", "<cmd>GoPkgOutline<CR>", desc = "Open pkg outline"},
        {"<Leader>cTa", "<cmd>GoAddTag<CR>", desc = "Add tags"},
        {"<Leader>cTr", "<cmd>GoRmTag<CR>", desc = "Remove tags"},
        {"go", "<cmd>GoAlt<CR>", desc = "Go to test/back to code", noremap = true},
      }
    end
  },
  {
    "LeonardsonCC/nvim-goc.lua",
    init = function()
      local goc = require("nvim-goc")
      goc.setup()

      -- TODO: make it toggle
      vim.keymap.set("n", "<Leader>ctc", goc.ToggleCoverage, { desc = "Code coverage" })
    end,
  },
}
