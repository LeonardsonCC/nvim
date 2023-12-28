return {
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      lsp_inlay_hints = {
        enable = true,
        style = 'inlay',
      },
    },
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    keys = {
      { '<leader>Gf', '<cmd>GoTestFile<CR>', desc = 'Go Test File' },
      { '<leader>Gp', '<cmd>GoTestPkg<CR>', desc = 'Go Test Package' },
      { '<leader>Gp', '<cmd>GoTestPkg<CR>', desc = 'Go Test Package' },
      { '<leader>Gi', '<cmd>GoIfErr<CR>', desc = 'Go If Err' },
    },
  },
  {
    'LeonardsonCC/nvim-goc.lua',
    event = { 'VeryLazy' },
    config = function()
      local goc = require('nvim-goc')
      goc.setup({ verticalSplit = false })

      vim.keymap.set('n', ',gc', goc.ToggleCoverage, { silent = true, desc = 'Go Code Coverage' })
    end,
  },
}
