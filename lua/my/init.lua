require 'my.set'
require 'my.packer'
require 'my.telescope'
require 'my.statusline'
require 'my.autocmds'
require 'my.ducksville'

-- netrw configs
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_list_hide = 1

require "fidget".setup {}
