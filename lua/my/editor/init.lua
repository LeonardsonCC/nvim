require('my.editor.colors')
require('my.editor.treesitter')
require('my.editor.statusline')
require('my.editor.term')

require('colorizer').setup()

require('illuminate').configure({
  providers = {
    'treesitter',
    'lsp',
    'regex',
  },
})

require('todo-comments').setup()

require('Comment').setup()

require('trouble').setup({
  icons = true,
})

require('guess-indent').setup {}


-- indent
require("indent_blankline").setup({
  show_end_of_line = true,
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
})
