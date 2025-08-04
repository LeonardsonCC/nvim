return {
  "echasnovski/mini.nvim",
  config = function()
    local statusline = require("mini.statusline")
    statusline.setup({ use_icons = vim.g.have_nerd_font })
    statusline.section_location = function()
      return "%2l:%-2v"
    end

    require("mini.ai").setup({
      n_lines = 500,
    })
    require("mini.surround").setup()
    require("mini.splitjoin").setup({
      mappings = { toggle = "gs", split = "", join = "" },
    })
    require("mini.pairs").setup()
    require("mini.pick").setup()

    vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>", {})
    vim.keymap.set("n", "<leader>fr", "<cmd>Pick resume<cr>", { desc = "Reopen" })
    vim.keymap.set("n", "<leader>sr", "<cmd>Pick resume<cr>", { desc = "Reopen" })
    vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<cr>", { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader><space>", "<cmd>Pick buffers<cr>", { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>sg", "<cmd>Pick grep_live<cr>", { desc = "Grep" })
    vim.keymap.set("n", "<leader>sg", "<cmd>Pick grep_live<cr>", { desc = "Grep" })
    vim.keymap.set("n", "<leader>sh", "<cmd>Pick help<cr>", { desc = "Search Help" })
  end,
}
