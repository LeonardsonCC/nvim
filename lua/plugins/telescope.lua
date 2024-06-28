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
        preview = {
          mime_hook = function(filepath, bufnr, opts)
            local is_image = function(filepath)
              local image_extensions = { "png", "jpg" } -- Supported image formats
              local split_path = vim.split(filepath:lower(), ".", { plain = true })
              local extension = split_path[#split_path]
              return vim.tbl_contains(image_extensions, extension)
            end
            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(_, data, _)
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d .. "\r\n")
                end
              end
              vim.fn.jobstart({
                "chafa",
                "--format=symbols",
                filepath, -- Terminal image viewer command
              }, { on_stdout = send_output, stdout_buffered = true, pty = false })
            else
              require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
            end
          end,
        },
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
