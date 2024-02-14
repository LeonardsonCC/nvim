return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
  },
  config = function()
    require('telescope').setup({
      defaults = require('telescope.themes').get_ivy({
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
        file_ignore_patterns = { 'src/mocks/' },
      }),
      extensions = {
        fzf = {
          fuzzy = true,
          case_mode = 'smart_case',
        },
        ['ui-select'] = {
          require('telescope.themes').get_ivy({
            -- even more opts
          }),
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
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- Telescope live_grep in git root
    -- Function to find the git root directory based on the current buffer's path
    local function find_git_root()
      -- Use the current buffer's path as the starting point for the git search
      local current_file = vim.api.nvim_buf_get_name(0)
      local current_dir
      local cwd = vim.fn.getcwd()
      -- If the buffer is not associated with a file, return nil
      if current_file == '' then
        current_dir = cwd
      else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ':h')
      end

      -- Find the Git root directory from the current file's path
      local git_root =
        vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
      if vim.v.shell_error ~= 0 then
        print('Not a git repository. Searching on current working directory')
        return cwd
      end
      return git_root
    end

    -- Custom live_grep function to search in git root
    local function live_grep_git_root()
      local git_root = find_git_root()
      if git_root then
        require('telescope.builtin').live_grep({
          search_dirs = { git_root },
        })
      end
    end

    vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').find_files, { desc = '[ ] Find files' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = '[/] Fuzzily search in current buffer' })

    local function telescope_live_grep_open_files()
      require('telescope.builtin').live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      })
    end
    vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
    vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
    vim.keymap.set('n', '<leader>sf', function()
      require('telescope.builtin').find_files({
        find_command = { 'rg', '--ignore', '--hidden', '--files', '--iglob', '!.git/*' },
        hidden = true,
        no_ignore = true,
      })
    end, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>st', require('telescope.builtin').treesitter, { desc = '[S]earch [T]reesitter' })
    -- telescope git
    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'Search [G]it [S]tatus' })
    vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = 'Search [G]it [C]ommits' })
    vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = 'Search [G]it [B]ranches' })
  end,
}
