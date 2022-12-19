require('my.completion.plugins')

require("lsp_signature").setup({})
local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'gopls',
  'intelephense',
})

local preselect = function(entry1, entry2)
  local preselect1 = entry1.completion_item.preselect or false
  local preselect2 = entry2.completion_item.preselect or false
  if preselect1 ~= preselect2 then
    return preselect1
  end
end
local compare = require('cmp.config.compare')

local cmp = require('cmp')

lsp.setup_nvim_cmp({
  sorting = {
    comparators = {
      preselect,
      compare.sort_text,
    }
  },
  mapping = lsp.defaults.cmp_mappings({
    ['<C-n>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
      else
        fallback()
      end
    end,
    ['<C-p>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
      else
        fallback()
      end
    end,
    ['<C-Space>'] = cmp.mapping.complete(),
  })
})

lsp.on_attach(function(_, bufnr)
  vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { buffer = bufnr, remap = false })
end)

lsp.set_preferences({
  suggest_lsp_servers = true,
})

lsp.nvim_workspace()
lsp.setup()
