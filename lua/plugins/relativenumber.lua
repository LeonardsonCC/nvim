-- Simple relative line number toggle plugin
-- Toggles between relative and normal line numbers

local M = {}

-- Toggle between relative and normal line numbers
function M.toggle()
  local current = vim.opt.relativenumber:get()
  vim.opt.relativenumber = not current

  local status = not current and "relative" or "normal"
  vim.notify("Line numbers: " .. status, vim.log.levels.INFO)
end

-- Initialize the plugin
function M.setup()
  -- Add keymap for toggling
  vim.keymap.set("n", "<leader>un", M.toggle, {
    desc = "Toggle relative/normal line numbers",
    silent = true,
  })

  -- Add command for toggling
  vim.api.nvim_create_user_command("ToggleLineNumbers", M.toggle, {
    desc = "Toggle between relative and normal line numbers",
  })
end

-- Auto-setup when the module is required
M.setup()

return {}

