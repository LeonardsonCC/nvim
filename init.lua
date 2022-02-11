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
require('leo.refactoring')

require('go').setup()

vim.g.material_style = "oceanic"
vim.cmd 'colorscheme material'
