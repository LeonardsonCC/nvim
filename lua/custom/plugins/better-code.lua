return {
  {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup()
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    opts = {
      mappings = {
        toggle = 'gs',
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    'norcalli/nvim-colorizer.lua',
    opts = {
      'css',
      'javascript',
      'lua',
      html = {
        mode = 'foreground',
      },
    },
  },
  {
    'gpanders/editorconfig.nvim',
  },
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
  {
    'nvim-pack/nvim-spectre',
    keys = {
      {
        '<leader>Sp',
        '<cmd>lua require("spectre").open_visual()<CR>',
        desc = '[S]earch and Replace in [P]roject',
      },
      {
        '<leader>Sw',
        '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
        desc = '[S]earch and Replace in [W]ord',
      },
      {
        '<leader>Sf',
        '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
        desc = '[S]earch and Replace in [F]ile',
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'NStefan002/visual-surround.nvim',
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {},
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
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
      ntest.setup({
        -- your neotest config here
        adapters = {
          require('neotest-go'),
        },
      })

      vim.keymap.set('n', '<leader>Tt', ntest.summary.toggle, { desc = '[T]est [T]oggle Summary' })
      vim.keymap.set('n', '<leader>Td', function()
        ntest.run.run()
      end, { desc = '[T]est [D]ebug' })
      vim.keymap.set('n', '<leader>Tw', ntest.watch.watch, { desc = '[T]est [W]atch' })
    end,
  },
}
