return {
  'echasnovski/mini.surround',
  version = false,
  keys = {
    { '<LEADER>sa', mode = { 'n', 'v' }, desc = 'Add Surround' },
    { '<LEADER>sd', mode = { 'n', 'v' }, desc = 'Delete Surround' },
    { '<LEADER>sf', mode = { 'n', 'v' }, desc = 'Find Left Surround' },
    { '<LEADER>sF', mode = { 'n', 'v' }, desc = 'Find Right Surround' },
    { '<LEADER>sh', mode = { 'n', 'v' }, desc = 'Highlight Surround' },
    { '<LEADER>sr', mode = { 'n', 'v' }, desc = 'Replace Surround' },
    { '<LEADER>sn', mode = { 'n', 'v' }, desc = 'Change # Neighbor Lines Surround' },
  },
  opts = {
    mappings = {
      add = '<LEADER>sa',
      delete = '<LEADER>sd',
      find = '<LEADER>sf',
      find_left = '<LEADER>sF',
      highlight = '<LEADER>sh',
      replace = '<LEADER>sr',
      update_n_lines = '<LEADER>sn',

      suffix_last = 'l',
      suffix_next = 'n',
    },
  },
}
