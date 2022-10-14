local nls = require 'null-ls'

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
-- local cmp = nls.builtins.completion

nls.setup {
  debug = true,
  sources = {
    fmt.stylua,
    fmt.goimports,
    fmt.prettierd,

    dgn.eslint_d,

    -- cmp.spell,
  },
}
