local vscode = require("vscode")

vim.keymap.set("n", "gr", function()
  vscode.action("references-view.findReferences")
end)

vim.keymap.set("n", "gd", function()
  vscode.action("editor.action.revealDefinition")
end)

vim.keymap.set("n", "gi", function()
  vscode.action("editor.action.goToImplementation")
end)

vim.keymap.set("n", "]d", function()
  vscode.action("editor.action.marker.next")
end)
vim.keymap.set("n", "[d", function()
  vscode.action("editor.action.marker.prev")
end)

vim.keymap.set("n", "<leader>ca", function()
  vscode.action("editor.action.quickFix")
end)
vim.keymap.set("n", "<leader>ci", function()
  vscode.action("editor.action.organizeImports")
end)
vim.keymap.set("n", "<leader>cr", function()
  vscode.action("editor.action.rename")
end)

return {}
