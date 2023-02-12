return {
  'folke/twilight.nvim',
  cmd = 'Twilight',
  keys = {
    { 'tw', '<CMD>Twilight<CR>', desc = 'Twilight Toggle' },
  },
  config = function()
    require('twilight').setup({})
  end,
}
