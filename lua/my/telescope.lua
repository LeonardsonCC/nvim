local telescope = require 'telescope'
local previewers = require 'telescope.previewers'

telescope.load_extension 'lsp_handlers'

telescope.setup {
  defaults = {
    prompt_prefix = ' >',
    color_devicons = true,

    file_ignore_patterns = { 'node_modules', '.git' },

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    mappings = {},
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  extensions = {
    lsp_handlers = {
      disable = {},
      location = {
        telescope = {},
        no_results_message = 'No references found',
      },
      symbol = {
        telescope = {},
        no_results_message = 'No symbols found',
      },
      call_hierarchy = {
        telescope = {},
        no_results_message = 'No calls found',
      },
      code_action = {
        telescope = {},
        no_results_message = 'No code actions available',
        prefix = '',
      },
    },
  },
}

local M = {}

M.search_dotfiles = function()
  require('telescope.builtin').find_files {
    prompt_title = '< VimRC >',
    cwd = vim.env.HOME .. '/dotfiles/',
    hidden = true,
  }
end

return M
