return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest",
  },
  opts = {
    adapters = {
      "neotest-jest",
      -- require("neotest-jest")({
      --   jestCommand = "npm test --",
      --   jestConfigFile = "custom.jest.config.ts",
      --   env = { CI = true },
      --   cwd = function(path)
      --     return vim.fn.getcwd()
      --   end,
      -- }),
    },
  },
}
