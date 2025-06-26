local vscode = require("vscode")

-- vim.keymap.set("n", "<c-h>", vscode.action("workbench.action.nextEditor"))
-- vim.keymap.set("n", "<c-j>", "<c-w>j")
-- vim.keymap.set("n", "<c-k>", "<c-w>k")
-- vim.keymap.set("n", "<c-l>", "<c-w>l")

-- navigation tabs
vim.keymap.set("n", "H", function()
  vscode.action("workbench.action.previousEditor")
end)
vim.keymap.set("n", "L", function()
  vscode.action("workbench.action.nextEditor")
end)

-- search
vim.keymap.set("n", "<leader>sf", function()
  vscode.action("workbench.action.quickOpen")
end)
vim.keymap.set("n", "<leader>sg", function()
  vscode.action("workbench.action.findInFiles")
end)

-- multi cursor
vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
  vscode.with_insert(function()
    vscode.action("editor.action.addSelectionToNextFindMatch")
  end)
end)

vim.keymap.set({ "n", "x" }, "<leader>cr", function()
  vscode.with_insert(function()
    vscode.action("editor.action.refactor")
  end)
end)
