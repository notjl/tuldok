return {
  'folke/twilight.nvim',
  cmd = 'Twilight',
  keys = {
    { '<C-t>', '<CMD>Twilight<CR>', desc = 'Twilight Toggle' },
  },
  config = function()
    require('twilight').setup({})
  end,
}
