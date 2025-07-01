local vscode = require("vscode")

vim.keymap.set("n", "<leader>tr", function()
  vscode.action("testing.runAtCursor")
end)
vim.keymap.set("n", "<leader>tf", function()
  vscode.action("testing.runCurrentFile")
end)
vim.keymap.set("n", "<leader>tt", function()
  vscode.action("testing.runCurrentFile")
end)
vim.keymap.set("n", "<leader>td", function()
  vscode.action("testing.debugAtCursor")
end)


return {}