-- Neovim configuration based on kickstart.nvim
-- This is a modular configuration with plugins split into separate files

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Check if we have nerd font
vim.g.have_nerd_font = false

-- Basic vim options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indenting
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Signcolumn
vim.opt.signcolumn = "yes"

-- Update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.winborder = "rounded"

-- List chars
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions
vim.opt.inccommand = "split"

-- Cursor line
vim.opt.cursorline = true
vim.opt.guicursor = ""

-- Scroll off
vim.opt.scrolloff = 10

-- Basic keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- LazyVim style diagnostic keymaps
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", function()
  vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error" })
vim.keymap.set("n", "[e", function()
  vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev Error" })
vim.keymap.set("n", "]w", function()
  vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Next Warning" })
vim.keymap.set("n", "[w", function()
  vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Prev Warning" })

-- Exit terminal mode with escape
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- LazyVim style window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- LazyVim style window management
vim.keymap.set("n", "<leader>-", "<C-w>s", { desc = "Split Window Below" })
vim.keymap.set("n", "<leader>|", "<C-w>v", { desc = "Split Window Right" })
vim.keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Delete Window" })

-- Save file (LazyVim style)
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure lazy.nvim with local plugins directory ]]
require("lazy").setup("plugins", {
  -- Configure lazy.nvim to use local plugins directory
  install = {
    colorscheme = { "tokyonight" },
  },
  checker = { enabled = false },
  change_detection = {
    enabled = false,
    notify = false,
  },
  -- Set the plugins directory to be inside the config folder
  -- root = vim.fn.stdpath("config") .. "/vendor",
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
