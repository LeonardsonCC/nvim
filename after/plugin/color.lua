vim.opt.background = 'dark'

vim.g.material_style = "deep ocean"

-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- require("catppuccin").setup()

require("tokyonight").setup({
  style = "night",
  light_style = "day",
  transparent = true,
  terminal_colors = true,
})

vim.cmd 'colorscheme tokyonight'
