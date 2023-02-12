return {
  'echasnovski/mini.surround',
  event = 'InsertEnter',
  version = false,
  config = function()
    require('mini.surround').setup({
      custom_surroundings = nil,

      highlight_duration = 500,
      mappings = {
        add = 'sa',
        delete = 'sd',
        find = 'sf',
        find_left = 'sF',
        highlight = 'sh',
        replace = 'sr',
        update_n_lines = 'sn',

        suffix_last = 'l',
        suffix_next = 'n',
      },
      n_lines = 20,

      search_method = 'cover',
    })
  end,
}
