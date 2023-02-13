return {
  'ZhiyuanLck/smart-pairs',
  keys = {
    { '{', mode = 'i' },
    { '[', mode = 'i' },
    { '{', mode = 'i' },
    { '>', mode = 'i' },
    { ')', mode = 'i' },
    { ']', mode = 'i' },
    { '}', mode = 'i' },
    { '"', mode = 'i' },
    { "'", mode = 'i' },
    { '`', mode = 'i' },
  },
  -- event = 'InsertEnter',
  config = function()
    require('pairs'):setup({})
  end,
}
