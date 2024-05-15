return {
  {
    'hrsh7th/nvim-cmp',
    priority = 100,
    event = 'InsertEnter',
    dependencies = {
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      -- completeopt = 'menu,menuone,noinsert',
      vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

      -- vim.o.shortmess = 'I'
      vim.opt.shortmess:append('c')

      local lspkind = require('lspkind')
      lspkind.init({})

      local cmp = require('cmp')

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'luasnip' },
        },
        mapping = {
          ['<C-Space>'] = cmp.mapping.complete({}),
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<CR>'] = cmp.mapping.confirm({
            -- behavior = cmp.ConfirmBehavior.Insert,
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
        },

        -- Enable luasnip to handle snippet expansion for nvim-cmp
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
            col_offset = -3,
            side_padding = 0,
          },
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          expandable_indicator = true,
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            local kind = require('lspkind').cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, '%s', { trimempty = true })
            kind.kind = ' ' .. (strings[1] or '') .. ' '
            kind.menu = '    (' .. (strings[2] or '') .. ')'

            return kind
          end,
        },
      })

      local ls = require('luasnip')
      ls.config.set_config({
        history = false,
        updateevents = 'TextChanged,TextChangedI',
      })
      require('luasnip.loaders.from_vscode').lazy_load()
      ls.config.setup({})

      -- for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/custom/snippets/*.lua', true)) do
      --   loadfile(ft_path)()
      -- end

      vim.keymap.set({ 'i', 's' }, '<c-k>', function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ 'i', 's' }, '<c-j>', function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })
    end,
  },
}
