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
}
