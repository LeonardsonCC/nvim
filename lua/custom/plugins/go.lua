return {
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    keys = {
      { ',gf', '<cmd>GoTestFile<CR>', desc = 'Go Test File' },
      { ',gp', '<cmd>GoTestPkg<CR>', desc = 'Go Test Package' },
      { ',gp', '<cmd>GoTestPkg<CR>', desc = 'Go Test Package' },
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
  {
    'crusj/hierarchy-tree-go.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    config = function()
      require('hierarchy-tree-go').setup({
        icon = {
          fold = '', -- fold icon
          unfold = '', -- unfold icon
          func = '₣', -- symbol
          last = '☉', -- last level icon
        },
        hl = {
          current_module = 'guifg=Green', -- highlight cwd module line
          others_module = 'guifg=Black', -- highlight others module line
          cursorline = 'guibg=Gray guifg=White', -- hl  window cursorline
        },
        keymap = {
          --global keymap
          incoming = '<space>fi', -- call incoming under cursorword
          outgoing = '<space>fo', -- call outgoing under cursorword
          open = '<space>ho', -- open hierarchy win
          close = '<space>hc', -- close hierarchy win
          -- focus: if hierarchy win is valid but is not current win, set to current win
          -- focus: if hierarchy win is valid and is current win, close
          -- focus  if hierarchy win not existing,open and focus
          focus = '<space>fu',

          -- bufkeymap
          expand = 'o', -- expand or collapse hierarchy
          jump = '<CR>', -- jump
          move = '<space><space>', -- switch the hierarchy window position, must be current win
        },
      })
    end,
  },
}
