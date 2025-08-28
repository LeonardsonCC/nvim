return {
  {
    "ruifm/gitlinker.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local gitlinker = require("gitlinker")

      local github_ignore_suffix = function(url_data)
        url_data.host = "github.com"
        return require("gitlinker.hosts").get_github_type_url(url_data)
      end

      gitlinker.setup({
        callbacks = {
          ["github.com-personal"] = github_ignore_suffix,
          ["github.com-emu"] = github_ignore_suffix,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>gy", function()
        gitlinker.get_buf_range_url("n")
      end, {})
      vim.keymap.set({ "n", "v" }, "<leader>go", function()
        gitlinker.get_buf_range_url("v", { action_callback = require("gitlinker.actions").open_in_browser })
      end, {})
    end,
  },
}
