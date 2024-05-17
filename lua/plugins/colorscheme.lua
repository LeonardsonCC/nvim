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

  hl.CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" }
  hl.CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" }
  hl.CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" }

  hl.CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" }
  hl.CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" }
  hl.CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" }

  hl.CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" }
  hl.CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" }
  hl.CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" }

  hl.CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" }
  hl.CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" }
  hl.CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" }
  hl.CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" }
  hl.CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" }

  hl.CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" }
  hl.CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" }

  hl.CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" }
  hl.CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" }
  hl.CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" }

  hl.CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" }
  hl.CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" }
  hl.CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" }

  hl.CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" }
  hl.CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" }
  hl.CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" }
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
