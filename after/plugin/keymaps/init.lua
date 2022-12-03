local nnoremap = require('my.keymap').nnoremap
local inoremap = require('my.keymap').inoremap
local vnoremap = require('my.keymap').vnoremap
local wk = require 'which-key'
local ls = require 'luasnip'

local gs = require 'gitsigns'
local lsp_buf = vim.lsp.buf
local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local h_mark = require 'harpoon.mark'
local h_ui = require 'harpoon.ui'

vim.api.nvim_create_user_command('Format', function(_)
  if vim.lsp.buf.format then
    vim.lsp.buf.format()
  elseif vim.lsp.buf.formatting then
    vim.lsp.buf.formatting()
  end
end, { desc = 'Format current buffer with LSP' })

wk.setup()

-- Escape keys
inoremap('jk', '<Esc>')
inoremap('kj', '<Esc>')

-- better indent
vnoremap('>', '>gv')
vnoremap('<', '<gv')

-- better moves
nnoremap('<S-h>', '_')
nnoremap('<S-l>', '$')
vnoremap('<S-h>', '_')
vnoremap('<S-l>', '$')

-- better copy and paste from clipboard
vnoremap('<Leader>y', '"+y')
vnoremap('<Leader>p', '"+p')
vnoremap('<Leader>yy', '"+yy')
vnoremap('<Leader>P', '"+P')

-- LSP
nnoremap('gd', vim.lsp.buf.definition)
nnoremap("gD", vim.lsp.buf.declaration)
nnoremap('gr', vim.lsp.buf.references)
nnoremap('gi', vim.lsp.buf.implementation)
nnoremap('<Leader>f', vim.lsp.buf.format)
nnoremap('K', vim.lsp.buf.hover)
nnoremap('[d', vim.diagnostic.goto_next)
nnoremap(']d', vim.diagnostic.goto_prev)
nnoremap('[g', vim.diagnostic.goto_next)
nnoremap(']g', vim.diagnostic.goto_prev)
inoremap('<C-h>', vim.lsp.buf.signature_help)
nnoremap('<Leader>d', vim.diagnostic.open_float)

-- Harpoon
nnoremap('<A-o>', h_ui.toggle_quick_menu)
nnoremap('<A-a>', h_mark.add_file)
nnoremap('<A-n>', h_ui.nav_next)
nnoremap('<A-p>', h_ui.nav_prev)

-- telescope
nnoremap('<Leader><Leader>', builtin.find_files)

-- LuaSnip
inoremap("<C-k>", function()
  print("executed", ls.expand_or_jumpable())
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end)
inoremap("<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)
inoremap("<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- Normal mode mappings
local opts = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

-- EASY TO REMEMBER

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
    g = { '<CMD>G<CR>', 'Git' },
  },
  t = {
    '<Cmd>TroubleToggle<CR>',
    'Trouble',
  },
  ['pv'] = {
    '<cmd>NvimTreeToggle<CR>',
    'Open FileTree',
  },
  ['pc'] = {
    '<cmd>NvimTreeFindFileToggle<CR>',
    'Open FileTree',
  },
  c = {
    '<Cmd>so %<CR>',
    'Current file',
  },
  u = { '<Cmd>UndotreeToggle<CR>', 'UndoTree' },
  l = {
    name = 'LSP',
    w = { lsp_buf.workspace_symbol, 'Workspace Symbol' },
    a = { lsp_buf.code_action, 'Code Action' },
    r = { lsp_buf.references, 'References' },
    R = { lsp_buf.rename, 'Rename' },
    f = { lsp_buf.format, 'Format' },
    g = {
      name = 'Go!',
      c = { '<CMD>GoCmt<CR>', 'Comment' },
      s = { '<CMD>GoFillStruct<CR>', 'Fill Struct' },
      w = { '<CMD>GoFillSwitch<CR>', 'Fill Switch' },
      e = { '<CMD>GoIfErr<CR>', 'If Err' },
    },
  },
  s = {
    name = 'Search',
    f = { builtin.find_files, 'Find File' },
    g = { builtin.live_grep, 'Grep' },
    b = { builtin.buffers, 'Buffers' },
    h = { builtin.help_tags, 'Help' },
    w = { builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols' },
    d = { builtin.lsp_document_symbols, 'Workspace Symbols' },
    k = { builtin.keymaps, 'Keymaps' },
  },
}, opts)
