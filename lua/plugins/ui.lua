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

return {}
