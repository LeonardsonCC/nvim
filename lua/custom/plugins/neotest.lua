return {
  'nvim-neotest/neotest',
  event = 'CursorHold',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-go',
  },
  lazy = false,
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace('neotest')
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)

    local ntest = require('neotest')

    ---@diagnostic disable-next-line: missing-fields
    ntest.setup({
      -- your neotest config here
      adapters = {
        require('neotest-go'),
      },
    })

    vim.keymap.set('n', '<leader>ts', ntest.summary.toggle, { desc = '[T]oggle [T]est Summary' })
    vim.keymap.set('n', '<leader>Td', function()
      ntest.run.run()
    end, { desc = '[T]est [D]ebug' })
    vim.keymap.set('n', '<leader>Tw', ntest.watch.watch, { desc = '[T]est [W]atch' })
  end,
}
