local find_request = function()
  require('telescope.builtin').find_files({
    cwd = '~/dev/requests/',
    hidden = true,
    no_ignore = true,
  })
end

local format_using_jq = function(body)
  local jq_query = vim.fn.input('jq query: ')
  if jq_query == '' then
    jq_query = '.'
  end

  return vim.fn.system({ 'jq', '-r', jq_query }, body)
end

return {
  'rest-nvim/rest.nvim',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    require('rest-nvim').setup({
      result = {
        formatters = {
          -- json = 'jq',
          json = format_using_jq,
          -- html = function(body)
          --   return vim.fn.system({ 'tidy', '-i', '-q', '-' }, body)
          -- end,
        },
        show_statistics = {
          {
            'time_total',
            title = 'Total Time: ',
            type = 'time',
          },
        },
      },
    })
  end,
  keys = {
    { '<leader>rr', '<plug>RestNvim', desc = '[R]un [R]equest' },
    { '<leader>rc', '<plug>RestNvimPreview', desc = 'Preview [R]equest [C]URL' },
    { '<leader>rs', find_request, desc = '[R]equest [S]earch' },
    { '<leader>rl', '<Plug>RestNvimLast', desc = '[R]equest [L]ast result' },
  },
}
