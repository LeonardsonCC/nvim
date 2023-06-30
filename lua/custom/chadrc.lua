---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "one_light" },
  transparency = true,

  statusline = {
    theme = "vscode_colored",
    overriden_modules = function()
      return {
        fileInfo = function()
          local icon = " 󰈚 "
          local filename = (vim.fn.expand "%" == "" and "Empty ") or vim.fn.expand "%:~:."

          if filename ~= "Empty " then
            local devicons_present, devicons = pcall(require, "nvim-web-devicons")

            if devicons_present then
              local ft_icon = devicons.get_icon(filename)
              icon = (ft_icon ~= nil and " " .. ft_icon) or ""
            end

            filename = " " .. filename .. " "
          end

          return "%#StText# " .. icon .. filename
        end,
      }
    end,
  },

  cmp = {
    style = "atom_colored",
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
