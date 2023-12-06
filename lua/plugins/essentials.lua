return {
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
    lazy = false,
  },
  {
    dir = "~/dev/sandbox/scrips.nvim/",
    config = function()
      local scrips = require("scrips").setup()

      require("telescope").load_extension("scrips")
      vim.keymap.set("n", "<Leader>se", require("telescope").extensions.scrips.find_file, { noremap = true })

      if scrips == nil then
        return
      end

      -- new script
      vim.keymap.set("n", "<Leader>,sn", scrips.new_script, { noremap = true, desc = "New script" })

      -- find scripts
      vim.keymap.set("n", "<Leader>se", require("telescope").extensions.scrips.find_file, { noremap = true })

      -- Run
      vim.keymap.set("n", "<Leader>er", scrips.run_paragraph, { noremap = true })
      vim.keymap.set("n", "<Leader>eR", scrips.run_file, { noremap = true })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre",
    config = function()
      require("symbol-usage").setup()
    end,
  },
}
