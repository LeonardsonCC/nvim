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
    lualine_b = {},
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
    lualine_x = { { 'diagnostics', always_visible = true } },
    lualine_z = {},
  },
}
