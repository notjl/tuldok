return {
  'echasnovski/mini.indentscope',
  version = '*',
  event = 'VeryLazy',
  config = function()
    require('mini.indentscope').setup()
  end,
}
