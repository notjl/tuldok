return {
  'ggandor/leap.nvim',
  keys = {
    { 's', desc = 'Search Forward' },
    { 'S', desc = 'Search Backward' },
  },
  config = function()
    require('leap').add_default_mappings()
  end,
}
