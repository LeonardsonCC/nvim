vim.g.tokyonight_style = 'night'
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.opt.background = 'dark'

-- vim.g.material_style = "deep ocean"

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()

vim.cmd 'colorscheme catppuccin'
