return {
  'echasnovski/mini.surround',
  event = 'InsertEnter',
  version = false,
  config = function()
    require('mini.surround').setup({
      custom_surroundings = nil,

      highlight_duration = 500,
      mappings = {
        add = '<C-s>a',
        delete = '<C-s>d',
        find = '<C-s>f',
        find_left = '<C-s>F',
        highlight = '<C-s>h',
        replace = '<C-s>r',
        update_n_lines = '<C-s>n',

        suffix_last = 'l',
        suffix_next = 'n',
      },
      n_lines = 20,

      search_method = 'cover',
    })
  end,
}
