return {
  'romgrk/barbar.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
  keys = {
    { '<S-h>', '<CMD>BufferPrevious<CR>', desc = 'Go to Previous Buffer' },
    { '<S-l>', '<CMD>BufferNext<CR>', desc = 'Go to Next Buffer' },
    { '<A-[>', '<CMD>BufferMovePrevious<CR>', desc = 'Move Current Buffer Left' },
    { '<A-]>', '<CMD>BufferMoveNext<CR>', desc = 'Move Current Buffer Right' },
    { '<LEADER>bp', '<CMD>BufferPin<CR>', desc = 'Pin Current Buffer' },
    { '<LEADER>bP', '<CMD>BufferPick<CR>', desc = 'Magic Buffer Pick Mode' },
    { '<LEADER>bb', '<CMD>BufferOrderByBufferNumber<CR>', desc = 'Order Buffer by Buffer Number' },
    { '<LEADER>bd', '<CMD>BufferOrderByDirectory<CR>', desc = 'Order Buffer by Directory' },
    { '<LEADER>bl', '<CMD>BufferOrderByLanguage<CR>', desc = 'Order Buffer by Language' },
    { '<LEADER>bw', '<CMD>BufferOrderByWindowNumber<CR>', desc = 'Order Buffer by WindowNumber' },
    { '<LEADER>bq', '<CMD>BufferClose<CR>', desc = 'Close Current Buffer' },
    { '<LEADER>bQ', '<CMD>BufferCloseAllButCurrent<CR>', desc = 'Close All Buffer Except Current' },
  },
  opts = {
    sidebar_filetypes = { ['neo-tree'] = { event = 'BufWipeout' } },
  },
}
