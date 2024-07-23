return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  keys = {
    { '<LEADER>T', '<CMD>TroubleToggle<CR>', desc = 'Toggle Trouble Diagnostic' },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('trouble').setup({})
  end,
}
