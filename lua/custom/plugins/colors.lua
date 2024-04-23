vim.cmd.highlight('NormalFloat guibg=#141414')
vim.cmd.highlight('CursorLine term=bold cterm=bold guibg=#141414')
vim.cmd.highlight('CursorLineNr guifg=#00d264')
vim.cmd.highlight('TelescopePreviewLine term=bold cterm=bold guibg=#343434')
vim.cmd.highlight('Visual guibg=#3e593f')

-- vim.cmd.highlight('DiagnosticErrorLn guibg=#301010')
-- vim.cmd.highlight('DiagnosticWarnLn guibg=#6b4a00')
-- vim.cmd.highlight('DiagnosticInfoLn guibg=#101030')
-- vim.cmd.highlight('DiagnosticHintLn guibg=#062f10')

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
    linehl = {
      -- [vim.diagnostic.severity.ERROR] = 'DiagnosticErrorLn',
      -- [vim.diagnostic.severity.WARN] = 'DiagnosticWarnLn',
      -- [vim.diagnostic.severity.INFO] = 'DiagnosticInfoLn',
      -- [vim.diagnostic.severity.HINT] = 'DiagnosticHintLn',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
      [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
      [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
      [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
    },
  },
})

local beautyTelescope = function(hl, c)
  local prompt = '#2d3149'
  hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
  hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
  hl.TelescopePromptNormal = { bg = prompt }
  hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
  hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
  hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
  hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
end

local beautyCmp = function(hl, c)
  hl.CmpItemAbbrDeprecated = { fg = '#7E8294', bg = 'NONE' }
  hl.CmpItemAbbrMatch = { fg = '#82AAFF', bg = 'NONE' }
  hl.CmpItemAbbrMatchFuzzy = { fg = '#82AAFF', bg = 'NONE' }
  hl.CmpItemMenu = { fg = '#C792EA', bg = 'NONE' }

  hl.CmpItemKindField = { fg = '#EED8DA', bg = '#B5585F' }
  hl.CmpItemKindProperty = { fg = '#EED8DA', bg = '#B5585F' }
  hl.CmpItemKindEvent = { fg = '#EED8DA', bg = '#B5585F' }

  hl.CmpItemKindText = { fg = '#C3E88D', bg = '#9FBD73' }
  hl.CmpItemKindEnum = { fg = '#C3E88D', bg = '#9FBD73' }
  hl.CmpItemKindKeyword = { fg = '#C3E88D', bg = '#9FBD73' }

  hl.CmpItemKindConstant = { fg = '#FFE082', bg = '#D4BB6C' }
  hl.CmpItemKindConstructor = { fg = '#FFE082', bg = '#D4BB6C' }
  hl.CmpItemKindReference = { fg = '#FFE082', bg = '#D4BB6C' }

  hl.CmpItemKindFunction = { fg = '#EADFF0', bg = '#A377BF' }
  hl.CmpItemKindStruct = { fg = '#EADFF0', bg = '#A377BF' }
  hl.CmpItemKindClass = { fg = '#EADFF0', bg = '#A377BF' }
  hl.CmpItemKindModule = { fg = '#EADFF0', bg = '#A377BF' }
  hl.CmpItemKindOperator = { fg = '#EADFF0', bg = '#A377BF' }

  hl.CmpItemKindVariable = { fg = '#C5CDD9', bg = '#7E8294' }
  hl.CmpItemKindFile = { fg = '#C5CDD9', bg = '#7E8294' }

  hl.CmpItemKindUnit = { fg = '#F5EBD9', bg = '#D4A959' }
  hl.CmpItemKindSnippet = { fg = '#F5EBD9', bg = '#D4A959' }
  hl.CmpItemKindFolder = { fg = '#F5EBD9', bg = '#D4A959' }

  hl.CmpItemKindMethod = { fg = '#DDE5F5', bg = '#6C8ED4' }
  hl.CmpItemKindValue = { fg = '#DDE5F5', bg = '#6C8ED4' }
  hl.CmpItemKindEnumMember = { fg = '#DDE5F5', bg = '#6C8ED4' }

  hl.CmpItemKindInterface = { fg = '#D8EEEB', bg = '#58B5A8' }
  hl.CmpItemKindColor = { fg = '#D8EEEB', bg = '#58B5A8' }
  hl.CmpItemKindTypeParameter = { fg = '#D8EEEB', bg = '#58B5A8' }
end

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'night',
        transparent = true,
        dim_inactive = true,
        on_highlights = function(hl, c)
          beautyTelescope(hl, c)
          beautyCmp(hl, c)
        end,
      })
      vim.cmd('colorscheme tokyonight')
    end,
  },
}
