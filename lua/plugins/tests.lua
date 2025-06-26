if vim.g.vscode then
  local vscode = require("vscode")

  -- tests
  vim.keymap.set({ "n" }, "<space>tr", function()
    vscode.action("testing.runAtCursor")
  end)
  vim.keymap.set({ "n" }, "<space>tt", function()
    vscode.action("testing.runCurrentFile")
  end)

end

return {}