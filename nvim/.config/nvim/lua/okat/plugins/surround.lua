return {
  'echasnovski/mini.surround',
  event = 'InsertEnter',
  version = false,
  config = function()
    require('mini.surround').setup({
      custom_surroundings = nil,

      highlight_duration = 500,
      mappings = {
        add = '<LEADER><S-s>a',
        delete = '<LEADER><S-s>d',
        find = '<LEADER><S-s>f',
        find_left = '<LEADER><S-s>F',
        highlight = '<LEADER><S-s>h',
        replace = '<LEADER><S-s>r',
        update_n_lines = '<LEADER><S-s>n',

        suffix_last = 'l',
        suffix_next = 'n',
      },
      n_lines = 20,

      search_method = 'cover',
    })
  end,
}
