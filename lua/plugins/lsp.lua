return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "echasnovski/mini.nvim",
    -- { "j-hui/fidget.nvim", opts = {} },
    { "folke/lazydev.nvim", opts = {} },
    -- { "nvim-java/nvim-java" },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- LazyVim style LSP keymaps
        map("gd", function()
          require("mini.extra").pickers.lsp({ scope = "definition" })
        end, "Goto Definition")
        map("gr", function()
          require("mini.extra").pickers.lsp({ scope = "references" })
        end, "References")
        map("gI", function()
          require("mini.extra").pickers.lsp({ scope = "implementation" })
        end, "Goto Implementation")
        map("gy", function()
          require("mini.extra").pickers.lsp({ scope = "type_definition" })
        end, "Goto Type Definition")
        map("gD", function()
          require("mini.extra").pickers.lsp({ scope = "declaration" })
        end, "Goto Declaration")
        map("K", vim.lsp.buf.hover, "Hover")
        map("gK", vim.lsp.buf.signature_help, "Signature Help")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("<leader>cr", vim.lsp.buf.rename, "Rename")
        map("<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
        map("<leader>csd", function()
          require("mini.extra").pickers.lsp({ scope = "document_symbol" })
        end, "Search document symbol")
        map("<leader>csw", function()
          require("mini.extra").pickers.lsp({ scope = "workspace_symbol" })
        end, "Search workspace symbol")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    }

    require("mason").setup()

    local ensure_installed = {}
    vim.list_extend(ensure_installed, {
      "lua-language-server",
      "stylua",
    })
    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
    })

    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

          require("lspconfig")[server_name].setup(server)
        end,
      },
    })

    local mason_auto_install = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end

    mason_auto_install(nil, {
      ensure_installed = ensure_installed,
    })
  end,
}
