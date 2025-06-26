local vscode = require("vscode")

-- [C]ode
vim.keymap.set({ "n" }, "gr", function()
  vscode.notify("Go to references")
  vscode.action("editor.action.goToReferences")
end)
vim.keymap.set({ "n" }, "gd", function()
  vscode.notify("Go to definition")
  vscode.action("editor.action.revealDefinition")
end)

return {}
