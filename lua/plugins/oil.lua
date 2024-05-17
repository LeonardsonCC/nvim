return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
  },
  keys = function()
    local oil = require("oil")
    return {
      { "<leader>tf", "<cmd>Oil<cr>", desc = "File Manager" },
      { "-", oil.toggle_float, desc = "File Manager float" },
    }
  end,
}
