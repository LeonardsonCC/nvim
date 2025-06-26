return {
  {
    "ruifm/gitlinker.nvim",
    config = function()
      local gitlinker = require("gitlinker")
      gitlinker.setup({
        callbacks = {
          ["github.com-emu"] = function(url_data)
            local url = "https://github.com/" ..
              url_data.repo .. "/blob/" .. url_data.rev .. "/" .. url_data.file
            if url_data.lstart then
              url = url .. "#L" .. url_data.lstart
              if url_data.lend then url = url .. "-L" .. url_data.lend end
            end
            return url
          end
        }
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    vscode = true,
    keys = {
      {
        "<leader>gy",
        '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',
        desc = "[G]it [Y]ank link",
      },
    },
  },
  {
    "nvim-lua/plenary.nvim",
    vscode = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    vscode = true,
  },
}
