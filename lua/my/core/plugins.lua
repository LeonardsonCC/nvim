local install_path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
local is_bootstrap = false
if not vim.loop.fs_stat(install_path) then
  is_bootstrap = true
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "git@github.com:folke/lazy.nvim.git",
    install_path,
  })
end
vim.opt.runtimepath:prepend(install_path)

require("lazy").setup('my.plugins', {
  defaults = { lazy = true },
  -- checker = { enabled = true },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
})

return is_bootstrap
