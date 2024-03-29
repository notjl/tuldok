return {
  'm4xshen/autoclose.nvim',
  keys = {
    { '{', mode = 'i' },
    { '[', mode = 'i' },
    { '{', mode = 'i' },
    { '>', mode = 'i' },
    { ')', mode = 'i' },
    { ']', mode = 'i' },
    { '}', mode = 'i' },
    { '"', mode = 'i' },
    { "'", mode = 'i' },
    { '`', mode = 'i' },
  },
  config = function()
    require('autoclose').setup({
      keys = {
        ['('] = { escape = false, close = true, pair = '()' },
        ['['] = { escape = false, close = true, pair = '[]' },
        ['{'] = { escape = false, close = true, pair = '{}' },

        ['>'] = { escape = true, close = false, pair = '<>' },
        [')'] = { escape = true, close = false, pair = '()' },
        [']'] = { escape = true, close = false, pair = '[]' },
        ['}'] = { escape = true, close = false, pair = '{}' },

        ['"'] = { escape = true, close = true, pair = '""' },
        ["'"] = { escape = true, close = true, pair = "''" },
        ['`'] = { escape = true, close = true, pair = '``' },
      },
      options = {
        disabled_filetypes = { 'text' },
      },
    })
  end,
}
