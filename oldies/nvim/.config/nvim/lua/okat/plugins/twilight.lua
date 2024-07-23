return {
  'folke/twilight.nvim',
  cmd = 'Twilight',
  keys = {
    { '<LEADER>T', '<CMD>Twilight<CR>', desc = 'Twilight Toggle' },
  },
  config = function()
    require('twilight').setup({})
  end,
}
