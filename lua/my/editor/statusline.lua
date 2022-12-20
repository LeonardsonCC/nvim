require('lualine').setup {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
  },
  sections = {
    lualine_a = { {
      'mode',
      fmt = function(str)
        return str:sub(1, 1)
      end,
    } },
    lualine_b = { 'lsp_progress' },
    lualine_c = {
      '%=',
      {
        'filetype',
        icon_only = true,
      },
      {
        'filename',
        path = 1,
      },
    },
    lualine_y = {},
    lualine_x = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = "#ff9e64" },
      },
      { 'diagnostics', always_visible = true }
    },
    lualine_z = {},
  },
}
