return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    -- {
    --   'nvim-telescope/telescope-fzf-native.nvim',
    --   build = 'make',
    --   cond = function()
    --     return vim.fn.executable('make') == 1
    --   end,
    -- },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
        file_ignore_patterns = { "src/mocks/" },
      },
      extensions = {
        fzf = {
          fuzzy = false,
          case_mode = "smart_case",
        },
      },
      pickers = {
        current_buffer_tags = { show_line = false },
        jumplist = { show_line = false },
        loclist = { show_line = false },
        lsp_definitions = { show_line = false },
        lsp_document_symbols = { show_line = false },
        lsp_dynamic_workspace_symbols = { show_line = false },
        lsp_implementations = { show_line = false },
        lsp_incoming_calls = { show_line = false },
        lsp_outgoing_calls = { show_line = false },
        lsp_references = {
          show_line = false,
        },
        lsp_type_definitions = { show_line = false },
        lsp_workspace_symbols = { show_line = false },
        quickfix = { show_line = false },
        tags = { show_line = false },
      },
    })

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
  end,
}
