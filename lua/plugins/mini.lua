return {
  "echasnovski/mini.nvim",
  config = function()
    local statusline = require("mini.statusline")
    statusline.setup({ use_icons = true })
    statusline.section_location = function()
      return "%2l:%-2v"
    end
    statusline.section_filename = function(args)
      -- In terminal always use plain name
      if vim.bo.buftype == "terminal" then
        return "%t"
      else
        -- Use relative path always
        return "%f%m%r"
      end
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
    require("mini.extra").setup()

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
