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
          text = { ' ' },
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
          condition = { true, builtin.not_empty },
          click = 'v:lua.ScFa',
        },
      },
    }
  end,
}
