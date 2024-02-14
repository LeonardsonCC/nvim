return {
  'backdround/neowords.nvim',
  config = function()
    local neowords = require('neowords')
    local p = neowords.pattern_presets

    local subword_and_ponctuation_hops = neowords.get_word_hops(
      p.snake_case,
      p.camel_case,
      p.upper_case,
      p.number,
      p.hex_color,
      '\\v\\.+',
      '\\v,+',
      '\\v\\=+',
      '\\v\\(+',
      '\\v\\)+',
      '\\v\\{+',
      '\\v\\}+',
      '\\v\\[+',
      '\\v\\]+',
      '\\v\\\'+',
      '\\v\\"+',
      '\\v\\/+'
    )

    vim.keymap.set({ 'n', 'x', 'o' }, 'w', subword_and_ponctuation_hops.forward_start)
    vim.keymap.set({ 'n', 'x', 'o' }, 'e', subword_and_ponctuation_hops.forward_end)
    vim.keymap.set({ 'n', 'x', 'o' }, 'b', subword_and_ponctuation_hops.backward_start)
    vim.keymap.set({ 'n', 'x', 'o' }, 'ge', subword_and_ponctuation_hops.backward_end)
  end,
}
