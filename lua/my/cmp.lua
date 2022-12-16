local lsp = require('lsp-zero')

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
