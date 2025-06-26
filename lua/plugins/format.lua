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
end

return {}