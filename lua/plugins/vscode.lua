if vim.g.vscode then
  local vscode = require("vscode")

  -- multi cursor
  vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
    vscode.with_insert(function()
      vscode.action("editor.action.addSelectionToNextFindMatch")
    end)
  end)
end

return {
  {
    "stevearc/conform.nvim",
    vscode = false,
  },
}
