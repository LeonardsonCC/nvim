return {
  'mfussenegger/nvim-lint',
  event = { 'BufWritePost', 'BufRead', 'InsertLeave' },
  config = function()
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufRead', 'InsertLeave' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
    require('lint').linters_by_ft = {
      typescriptreact = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      go = { 'golangcilint' },
    }
  end,
}
