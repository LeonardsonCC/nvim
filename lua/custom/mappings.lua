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

return M
