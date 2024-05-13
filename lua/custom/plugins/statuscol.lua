return {
  'luukvbaal/statuscol.nvim',
  event = 'VeryLazy',
  opts = function()
    local builtin = require('statuscol.builtin')

    return {
      bt_ignore = { 'nofile', 'terminal' },
      ft_ignore = { 'NeogitStatus' },
      segments = {
        {
          sign = { namespace = { 'gitsigns' }, colwidth = 1, wrap = true },
          click = 'v:lua.ScSa',
        },
        {
          sign = {
            name = { '.*' },
            text = { '.*' },
          },
          click = 'v:lua.ScSa',
        },
        {
          text = { builtin.lnumfunc, '' },
          condition = { builtin.not_empty },
          click = 'v:lua.ScLa',
        },
        {
          text = {
            function(args)
              args.fold.close = ''
              args.fold.open = ''
              args.fold.sep = '▕'
              return builtin.foldfunc(args)
            end,
          },
          condition = {
            function()
              return vim.o.foldcolumn ~= '0'
            end,
          },
          click = 'v:lua.ScFa',
        },
      },
    }
  end,
}
