if vim.g.vscode then
  local vscode = require("vscode")

  -- format
  vim.g.autoformat = false
  LazyVim.on_very_lazy(function()
    LazyVim.format.register({
      name = "vscode",
      priority = 500,
      primary = true,
      format = function(buf)
        local vscode = require("vscode")
        vscode.action("editor.action.formatDocument")
      end,
      sources = function(buf)
        return { "vscode" }
      end,
    })
  end)
  vim.keymap.set({ "v" }, "<space>cF", function()
    vscode.action("editor.action.formatSelection")
  end)

  -- tests
  vim.keymap.set({ "n" }, "<space>tr", function()
    vscode.action("testing.runAtCursor")
  end)
  vim.keymap.set({ "n" }, "<space>tt", function()
    vscode.action("testing.runCurrentFile")
  end)

  -- multi cursor
  vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
    vscode.with_insert(function()
      vscode.action("editor.action.addSelectionToNextFindMatch")
    end)
  end)
  
  -- [C]ode
  vim.keymap.set({ "n" }, "gr", function()
    vscode.notify("Go to references")
    vscode.action("editor.action.goToReferences")
  end)
  vim.keymap.set({ "n" }, "gd", function()
    vscode.notify("Go to definition")
    vscode.action("editor.action.revealDefinition")
  end)
  
  -- [U]I
  vim.keymap.set({ "n" }, "<leader>uu", function()
    vscode.action("workbench.action.toggleCenteredLayout")
  end)
  vim.keymap.set({ "n" }, "<leader>un", function()
    vscode.notify(vscode.get_config('editor.lineNumbers'))
    if vscode.get_config("editor.lineNumbers") == "relative" then
      vscode.update_config("editor.lineNumbers", "on")
    else
      vscode.update_config("editor.lineNumbers", "relative")
    end
  end)
  
  -- [X] Trouble
  vim.keymap.set({ "n" }, "<leader>xx", function()
    vscode.action("workbench.action.problems.focus")
  end)
end

return {
  {
    "stevearc/conform.nvim",
    vscode = false,
  },
}
