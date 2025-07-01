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

vim.keymap.set("n", "<leader>ul", function()
  vscode.action("workbench.action.toggleSidebarVisibility")
end)
vim.keymap.set("n", "<leader>uh", function()
  vscode.action("workbench.action.toggleAuxiliaryBar")
end)
vim.keymap.set("n", "<leader>ub", function()
  vscode.action("workbench.action.togglePanel")
end)
vim.keymap.set("n", "<leader>ua", function()
  if vscode.get_config("editor.cursorSmoothCaretAnimation") == "on" then
    vscode.update_config("editor.cursorSmoothCaretAnimation", "off", "global")
  else
    vscode.update_config("editor.cursorSmoothCaretAnimation", "on", "global")
  end
end)

vim.keymap.set("n", "<leader>uf", function()
  if vscode.get_config("editor.formatOnSave") then
    vscode.update_config("editor.formatOnSave", false, "global")
    vscode.update_config("jdk.java.onSave.organizeImports", false, "global")
    vscode.notify("Format on save disabled")
  else
    vscode.update_config("editor.formatOnSave", true, "global")
    vscode.update_config("jdk.java.onSave.organizeImports", true, "global")
    vscode.notify("Format on save enabled")
  end
end)
vim.keymap.set("n", "<leader>uc", function()
  if vscode.get_config("go.coverOnSave") then
    vscode.action("go.test.coverage")
    vscode.update_config("go.coverOnSave", false, "global")
    vscode.notify("Go coverage on save disabled")
  else
    vscode.update_config("go.coverOnSave", true, "global")
    vscode.notify("Go coverage on save enabled")
  end
end)

return {}
