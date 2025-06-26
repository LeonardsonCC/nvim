local vscode = require("vscode")

vim.keymap.set("n", "<leader>uu", function()
  vscode.action("workbench.action.toggleZenMode")
end)

vim.keymap.set("n", "<leader>un", function()
  if vscode.get_config("editor.lineNumbers") == "on" then
    vscode.update_config("editor.lineNumbers", "relative", "global")
  else
    vscode.update_config("editor.lineNumbers", "on", "global")
  end
end)

vim.keymap.set("n", "<leader>uf", function()
  vscode.action("workbench.action.toggleFullScreen")
end)

vim.keymap.set("n", "<leader>ul", function()
  vscode.action("workbench.action.toggleSidebarVisibility")
end)
vim.keymap.set("n", "<leader>uh", function()
  vscode.action("workbench.action.toggleAuxiliaryBar")
end)
vim.keymap.set("n", "<leader>ub", function()
  vscode.action("workbench.action.togglePanel")
end)

return {}
