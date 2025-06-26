if vim.g.vscode then
  local vscode = require("vscode")

  -- [X] Trouble
  vim.keymap.set({ "n" }, "<leader>xx", function()
    vscode.action("workbench.action.problems.focus")
  end)
end

return {}