return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
      local builtin = require "telescope.builtin"

      return {
        { "<Leader>ff", builtin.find_files, desc = "Find Files" },
        { "<Leader><space>", builtin.find_files, desc = "Find Files" },
        {
          "<Leader>fa",
          function()
            builtin.find_files {
              find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            }
          end,
          desc = "Find in all Files",
        },
        { "<Leader>fw", builtin.live_grep, desc = "Find Word" },
        { "<Leader>fh", builtin.help_tags, desc = "Find Help" },
        { "<Leader>fm", builtin.man_pages, desc = "Find Man Pages" },
        { "<Leader>fb", builtin.buffers, desc = "Find Buffer" },
        { "<Leader>fo", builtin.oldfiles, desc = "Find Old file" },
        { "<Leader>fk", builtin.keymaps, desc = "Find Old file" },
        { "<Leader>ft", builtin.treesitter, desc = "Find Treesitter" },
        -- Git
        { "<Leader>fgc", builtin.git_commits, desc = "Find Git Commit" },
        { "<Leader>fgf", builtin.git_bcommits, desc = "Find Git Commit for File" },
        { "<Leader>fgb", builtin.git_branches, desc = "Find Git Branch" },
      }
    end,
  },
}
