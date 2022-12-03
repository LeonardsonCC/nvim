local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'gopls',
  'intelephense',
})

require 'my.cmp'

lsp.on_attach(function(client, bufnr)
  vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { buffer = bufnr, remap = false })
end)

lsp.set_preferences({
  suggest_lsp_servers = true,
})

lsp.nvim_workspace()
lsp.setup()
