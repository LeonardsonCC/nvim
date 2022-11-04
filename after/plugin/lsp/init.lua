-- Setup mason
require('mason').setup()
require('mason-lspconfig').setup {
  -- to be used in nvim configuration
  ensure_installed = { 'sumneko_lua' },
  automatic_installation = true,
}
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  },
})
require("mason-null-ls").setup()

-- Setup automatic LSP handler
local lspconfig = require 'lspconfig'
require('mason-lspconfig').setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {}
  end,
  ['sumneko_lua'] = function()
    lspconfig.sumneko_lua.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }
  end,
  ['gopls'] = function()
    lspconfig.gopls.setup {
      settings = {
        gopls = {
          experimentalPostfixCompletions = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
      init_options = {
        usePlaceholders = true,
      },
    }
  end
}
