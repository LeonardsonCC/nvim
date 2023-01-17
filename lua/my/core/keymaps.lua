local wk = require 'which-key'
local ls = require 'luasnip'
local scrips = require 'scrips'

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

vim.keymap.set('n', '<leader>p', '<cmd>:Lazy<cr>')

-- Escape keys
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')

-- move lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- don't move when J
vim.keymap.set('n', 'J', 'mzJ`z')

-- center when moving around
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- better indent
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- better moves
vim.keymap.set('n', '<S-h>', '_')
vim.keymap.set('n', '<S-l>', '$')
vim.keymap.set('v', '<S-h>', '_')
vim.keymap.set('v', '<S-l>', '$')

-- replace current word
vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- make current file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<cr>')

-- better copy and paste from clipboard
vim.keymap.set('v', '<Leader>y', '"+y')
vim.keymap.set('v', '<Leader>p', '"+p')
vim.keymap.set('v', '<Leader>yy', '"+yy')
vim.keymap.set('v', '<Leader>P', '"+P')

-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '[d', vim.diagnostic.goto_next)
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '[g', vim.diagnostic.goto_next)
vim.keymap.set('n', ']g', vim.diagnostic.goto_prev)
vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float)

-- Harpoon
vim.keymap.set('n', '<A-o>', h_ui.toggle_quick_menu)
vim.keymap.set('n', '<A-a>', h_mark.add_file)
vim.keymap.set('n', '<A-n>', h_ui.nav_next)
vim.keymap.set('n', '<A-p>', h_ui.nav_prev)

-- telescope
vim.keymap.set('n', '<Leader><Leader>', builtin.find_files)

-- LuaSnip
vim.keymap.set('i', '<C-k>', function()
  print('executed', ls.expand_or_jumpable())
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end)
vim.keymap.set('i', '<C-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)
vim.keymap.set('i', '<C-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- Easy Cmd
vim.keymap.set('n', '<Leader>cn', scrips.new_script)
vim.keymap.set('n', '<Leader>cr', scrips.run_paragraph)
vim.keymap.set('n', '<Leader>cR', scrips.run_file)
vim.keymap.set('n', '<Leader>fe', telescope.extensions.scrips.find_file)

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
  },
  ['tr'] = {
    '<Cmd>TroubleToggle<CR>',
    'Trouble',
  },
  ['e'] = {
    '<cmd>NeoTreeFocusToggle<CR>',
    'Open FileTree',
  },
  s = {
    c = {
      '<Cmd>so %<CR>',
      'Current file',
    },
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
  f = {
    name = 'Search',
    f = { telescope.extensions.smart_open.smart_open, 'Find file' },
    F = {
      function()
        builtin.find_files {
          hidden = true,
          no_ignore = true,
        }
      end,
      'Find File',
    },
    g = { builtin.live_grep, 'Grep' },
    b = { builtin.buffers, 'Buffers' },
    h = { builtin.help_tags, 'Help' },
    w = { builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols' },
    d = { builtin.lsp_document_symbols, 'Workspace Symbols' },
    k = { builtin.keymaps, 'Keymaps' },
  },
}, opts)
