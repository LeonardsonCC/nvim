if not vim.g.vscode then
  print("Not in VSCode")
  return
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
