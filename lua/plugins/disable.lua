local disable_plugin = function(plugin)
  return {
    plugin,
    enabled = false,
  }
end

return {
  disable_plugin("nvim-neo-tree/neo-tree.nvim"),
  disable_plugin("akinsho/bufferline.nvim"),
  disable_plugin("folke/noice.nvim"),
  disable_plugin("folke/flash.nvim"),
}
