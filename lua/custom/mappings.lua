local qf = require "custom.nice-functions.quickfix"

---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
  },
}

M.general = {
  n = {
    ["<leader>gg"] = { "<cmd>Git<CR>", "FuGITive" },
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
    ["<leader>gt"] = { "<cmd>GoTest -f<cr>", "Run Go test" },
  },
}

return M
