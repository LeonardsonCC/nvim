local is_bootstrap = require 'my.core.packer'
if is_bootstrap then
  return
end

require 'my.core.set'
require 'my.core.autocmds'
require 'my.vcs'
require 'my.completion'
require 'my.navigation'
require 'my.fun'
require 'my.editor'
require 'my.core.keymaps'

-- netrw configs
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_list_hide = 1

require('telescope').load_extension('scrips')
