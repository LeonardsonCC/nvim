return {
  {
    "dmmulroy/tsc.nvim",
    config = function()
      require("tsc").setup()
    end,
    cmd = { "TSC" },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        tsserver = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
