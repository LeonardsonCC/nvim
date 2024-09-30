local beautyTelescope = function(hl, c)
  local prompt = "#2d3149"
  hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
  hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
  hl.TelescopePromptNormal = { bg = prompt }
  hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
  hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
  hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
  hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
end

local beautyCmp = function(hl, c)
  hl.CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE" }
  hl.CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE" }
  hl.CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE" }
  hl.CmpItemMenu = { fg = "#C792EA", bg = "NONE" }

  hl.CmpItemKindField = { fg = "#B5585F" }
  hl.CmpItemKindProperty = { fg = "#B5585F" }
  hl.CmpItemKindEvent = { fg = "#B5585F" }

  hl.CmpItemKindText = { fg = "#9FBD73" }
  hl.CmpItemKindEnum = { fg = "#9FBD73" }
  hl.CmpItemKindKeyword = { fg = "#9FBD73" }

  hl.CmpItemKindConstant = { fg = "#D4BB6C" }
  hl.CmpItemKindConstructor = { fg = "#D4BB6C" }
  hl.CmpItemKindReference = { fg = "#D4BB6C" }

  hl.CmpItemKindFunction = { fg = "#A377BF" }
  hl.CmpItemKindStruct = { fg = "#A377BF" }
  hl.CmpItemKindClass = { fg = "#A377BF" }
  hl.CmpItemKindModule = { fg = "#A377BF" }
  hl.CmpItemKindOperator = { fg = "#A377BF" }

  hl.CmpItemKindVariable = { fg = "#7E8294" }
  hl.CmpItemKindFile = { fg = "#7E8294" }

  hl.CmpItemKindUnit = { fg = "#D4A959" }
  hl.CmpItemKindSnippet = { fg = "#D4A959" }
  hl.CmpItemKindFolder = { fg = "#D4A959" }

  hl.CmpItemKindMethod = { fg = "#6C8ED4" }
  hl.CmpItemKindValue = { fg = "#6C8ED4" }
  hl.CmpItemKindEnumMember = { fg = "#6C8ED4" }

  hl.CmpItemKindInterface = { fg = "#58B5A8" }
  hl.CmpItemKindColor = { fg = "#58B5A8" }
  hl.CmpItemKindTypeParameter = { fg = "#58B5A8" }
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
      dim_inactive = true,
      on_highlights = function(hl, c)
        beautyTelescope(hl, c)
        beautyCmp(hl, c)
      end,
    },
  },
}
