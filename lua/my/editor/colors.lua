function Colorscheme(colorscheme)
  colorscheme = colorscheme or "tokyonight"
  vim.cmd.colorscheme(colorscheme)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

require("tokyonight").setup({
  style = "night",
  light_style = "day",
  transparent = true,
  terminal_colors = true,
})

Colorscheme()
