local neogit = require 'neogit'
local nnoremap = require('my.keymap').nnoremap

neogit.setup {}

nnoremap('<leader>gg', function()
  neogit.open {}
end)

nnoremap('<leader>ga', '<cmd>!git fetch --all<CR>')
