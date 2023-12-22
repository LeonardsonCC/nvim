return {
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require('null-ls')

      null_ls.setup({
        log_level = 'debug',
        sources = {
          -- null_ls.builtins.formatting.goimports_reviser.with({
          --   args = { '-rm-unused', '$FILENAME' },
          -- }),
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.eslint,
        },
      })
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
