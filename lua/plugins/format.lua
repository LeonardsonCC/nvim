local vscode = require("vscode")

vim.keymap.set("n", "<leader>cf", function()
  vscode.action("editor.action.formatDocument")
end)

vim.keymap.set({ "v" }, "<space>cF", function()
  vscode.action("editor.action.formatSelection")
end)

return {}
