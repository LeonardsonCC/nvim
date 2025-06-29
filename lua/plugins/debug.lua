local vscode = require("vscode")

vim.keymap.set("n", "<leader>dd", function()
  vscode.action("workbench.action.debug.selectandstart")
end)
vim.keymap.set("n", "<leader>db", function()
  vscode.action("editor.debug.action.toggleBreakpoint")
end)


return {}