require('my.editor.colors')
require('my.editor.treesitter')
require('my.editor.statusline')
require('my.editor.term')

require('colorizer').setup()
require("indent_blankline").setup({})

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
