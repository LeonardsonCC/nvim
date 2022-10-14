local nnoremap = require('my.keymap').nnoremap
local inoremap = require('my.keymap').inoremap
local vnoremap = require('my.keymap').vnoremap
local wk = require 'which-key'

wk.setup()

-- Escape keys
inoremap('jk', '<Esc>')
inoremap('kj', '<Esc>')

-- better indent
vnoremap('>', '>gv')
vnoremap('<', '<gv')

-- Normal mode mappings
local opts = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local gs = require 'gitsigns'
local lsp_buf = vim.lsp.buf
local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local my_telescope = require 'my.telescope'
local h_mark = require 'harpoon.mark'
local h_ui = require 'harpoon.ui'

wk.register({
  g = {
    name = 'Git',
    s = { '<CMD>Gitsigns stage_hunk<CR>', 'Stage' },
    r = { '<CMD>Gitsigns reset_hunk<CR>', 'Reset' },
    u = { gs.undo_stage_hunk, 'Undo Stage' },
    p = { gs.preview_hunk, 'Preview' },
    l = { gs.toggle_current_line_blame, 'Line Blame' },
    t = { gs.diffthis, 'Open Diff' },
    a = 'Fetch All',
    g = 'Neogit',
  },
  t = {
    '<Cmd>TroubleToggle<CR>',
    'Trouble',
  },
  ['<Leader>'] = {
    '<Cmd>NvimTreeFindFileToggle<CR>',
    'Open FileTree',
  },
  s = {
    name = 'Source',
    c = { '<Cmd>so %<CR>', 'Current file' },
  },
  u = { '<Cmd>UndotreeToggle<CR>', 'UndoTree' },
  l = {
    name = 'LSP',
    w = { lsp_buf.workspace_symbol, 'Workspace Symbol' },
    d = { vim.diagnostic.open_float, 'Diagnostic' },
    a = { lsp_buf.code_action, 'Code Action' },
    r = { lsp_buf.references, 'References' },
    R = { lsp_buf.rename, 'Rename' },
    f = { lsp_buf.format, 'Format' },
    g = {
      name = 'Go!',
      i = { telescope.extensions.goimpl.goimpl, 'Impl' },
      c = { '<CMD>GoCmt<CR>', 'Comment' },
      s = { '<CMD>GoFillStruct<CR>', 'Fill Struct' },
      w = { '<CMD>GoFillSwitch<CR>', 'Fill Switch' },
      e = { '<CMD>GoIfErr<CR>', 'If Err' },
    },
  },
  f = {
    name = 'Find',
    f = { builtin.find_files, 'Find File' },
    g = { builtin.live_grep, 'Grep' },
    b = { builtin.buffers, 'Buffers' },
    h = { builtin.help_tags, 'Help' },
    w = { builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols' },
    k = { builtin.keymaps, 'Keymaps' },
    d = { my_telescope.search_dotfiles, 'Find Dotfile' },
  },
  -- Harpoon
  o = { h_ui.toggle_quick_menu, 'Harpoon - Open Menu' },
  a = { h_mark.add_file, 'Harpoon - Add File' },
  n = { h_ui.nav_next, 'Harpoon - Next Mark' },
  p = { h_ui.nav_prev, 'Harpoon - Prev Mark' },
}, opts)

-- LSP other mappings
nnoremap('gd', function()
  vim.lsp.buf.definition()
end)
nnoremap('gD', function()
  vim.lsp.buf.declaration()
end)
nnoremap('K', function()
  vim.lsp.buf.hover()
end)
nnoremap('[d', function()
  vim.diagnostic.goto_next()
end)
nnoremap(']d', function()
  vim.diagnostic.goto_prev()
end)
inoremap('<C-h>', function()
  vim.lsp.buf.signature_help()
end)

-- Term
nnoremap('<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
