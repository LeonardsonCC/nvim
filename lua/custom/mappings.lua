local qf = require "custom.nice-functions.quickfix"

---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>gt"] = "",
  },
}

M.general = {
  n = {
    ["<leader>zz"] = { "<cmd>ZenMode<CR>", "ZenMode" },
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "LazyGit" },
    ["<leader>q"] = { qf.toggle_qf, "Close quickfix list" },
    ["<C-d>"] = { "<C-d>zz", "center when moving around" },
    ["<C-u>"] = { "<C-u>zz", "center when moving around" },
    ["n"] = { "nzzzv", "center when moving around" },
    ["N"] = { "Nzzzv", "center when moving around" },
  },
  v = {
    [">"] = { ">gv", "better indent" },
    ["<"] = { "<gv", "better indent" },
  },
}

M.telescope = {
  n = {
    ["<leader><space>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
  },
}

M.tabufline = {
  n = {
    -- cycle through buffers
    ["L"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["H"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    ["<leader>bd"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.lspconfig = {
  n = {
    ["<leader>d"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
  },
}

M.go = {
  n = {
    ["<leader>gtr"] = { "<cmd>GoTest -f<cr>", "Run Go test" },
    ["<leader>gtp"] = { "<cmd>GoTestPkg<cr>", "Run Go test to a package" },
    ["<leader>gtw"] = { "<cmd>GoTestSum -w<cr>", "Watch files and run Go tests" },
    ["<leader>gtl"] = { "<cmd>GoCodeLenAct<cr>", "Code Lens actions" },
    ["<leader>gtc"] = { "<cmd>GoCoc<cr>", "Toggle Go coverage" },
  },
}

M.harpoon = {
  n = {
    ["<A-a>"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add file to harpoon",
    },
    ["<A-o>"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Open menu",
    },
    ["<A-n>"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
      "Next harpoon file",
    },
    ["<A-p>"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "Previous harpoon file",
    },
  },
}

return M
