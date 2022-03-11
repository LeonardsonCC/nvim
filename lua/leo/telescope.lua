-- Keybindings
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":lua require(\"telescope.builtin\").find_files()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>sf", ":lua require(\"telescope.builtin\").grep_string()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>sp", ":lua require(\"telescope.builtin\").live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>bb", ":lua require(\"telescope.builtin\").buffers()<CR>", { noremap = true })

-- Config
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {
      "node_modules/*",
      "plugged/*",
      "undodir/*"
    },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
