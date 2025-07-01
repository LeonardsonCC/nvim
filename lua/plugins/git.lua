local vscode = require("vscode")

vim.keymap.set("n", "<leader>ghp", function()
    vscode.action('git.openChange')
end, {})

vim.keymap.set({"n", "v"}, "<leader>ghs", function()
    vscode.action('git.stageSelectedRanges')
end, {})

vim.keymap.set({"n", "v"}, "<leader>ghu", function()
    vscode.action('git.unstageSelectedRanges')
end, {})

vim.keymap.set({"n", "v"}, "<leader>ghr", function()
    vscode.action('git.revertSelectedRanges')
end, {})

vim.keymap.set("n", "]g", function()
    vscode.action('workbench.action.editor.nextChange')
end, {})
vim.keymap.set("n", "[g", function()
    vscode.action('workbench.action.editor.previousChange')
end, {})

return {}