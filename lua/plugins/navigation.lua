return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
      { "<leader>/", false },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<A-o>",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon menu",
      },
      {
        "<A-a>",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Harpoon Add",
      },
      {
        "<A-n>",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Harpoon Next",
      },
      {
        "<A-p>",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Harpoon Prev",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
}
