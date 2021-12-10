vim.g["dashboard_custom_header"] = {
' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

vim.g["dashboard_custom_section"] = {
  a = {
    description = { "🔍 Find File           " },
    command = "Telescope find_files"
  },
  b = {
    description = { "🌳 Open Tree           " },
    command = "NvimTreeOpen"
  },
  c = {
    description = { "🌈 Change colorscheme  " },
    command = "lua require('telescope.builtin').colorscheme()"
  },
  d = {
    description = { "⚙️  Edit configuration  " },
    command = "e $MYVIMRC"
  },
}
