if vim.g.vscode then
  local vscode = require("vscode")

  -- [U]I
  vim.keymap.set({ "n" }, "<leader>uu", function()
    vscode.action("workbench.action.toggleZenMode")
  end)

  vim.keymap.set({ "x", "n", "v" }, "<leader>un", function()
    vscode.notify("Line numbers")
  end)
end

return {}
