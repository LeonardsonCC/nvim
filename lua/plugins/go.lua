return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      codelens = {
        enabled = true,
      },
      servers = {
        gopls = {
          settings = {
            gopls = {
              codelenses = {
                gc_details = true,
              },
            },
          },
        },
      },
    },
  },
}
