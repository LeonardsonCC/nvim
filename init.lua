require('leo.plugins')
require('leo.sets')
require('leo.keybindings')
require('leo.statusline')
require('leo.lsp')
require('leo.telescope')
require('leo.cmp')
require('leo.dashboard')
require('leo.symbols_outline')
require('leo.termwrapper')
require('leo.luatab')
-- require('leo.null_ls')
require('leo.telekasten')

require('go').setup()

vim.cmd 'colorscheme gruvbox'
