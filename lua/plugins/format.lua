local vscode = require("vscode")

vim.keymap.set("n", "<leader>cf", function()
  vscode.action("editor.action.formatDocument")
end)

vim.keymap.set({ "v" }, "<space>cF", function()
  vscode.action("editor.action.formatSelection")
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

return {}
