return {
  'romgrk/barbar.nvim',
  event = 'VeryLazy',
  keys = {
    { '<S-h>', '<CMD>BufferPrevious<CR>', desc = 'Go to Previous Buffer' },
    { '<S-l>', '<CMD>BufferNext<CR>', desc = 'Go to Next Buffer' },
    { '<S-<>', '<CMD>BufferMovePrevious<CR>', desc = 'Move Current Buffer Left' },
    { '<S->>', '<CMD>BufferMoveNext<CR>', desc = 'Move Current Buffer Right' },
    { '<LEADER>bp', '<CMD>BufferPin<CR>', desc = 'Pin Current Buffer' },
    { '<LEADER>bP', '<CMD>BufferPick<CR>', desc = 'Magic Buffer Pick Mode' },
    { '<LEADER>bb', '<CMD>BufferOrderByBufferNumber<CR>', desc = 'Order Buffer by Buffer Number' },
    { '<LEADER>bd', '<CMD>BufferOrderByDirectory<CR>', desc = 'Order Buffer by Directory' },
    { '<LEADER>bl', '<CMD>BufferOrderByLanguage<CR>', desc = 'Order Buffer by Language' },
    { '<LEADER>bw', '<CMD>BufferOrderByWindowNumber<CR>', desc = 'Order Buffer by WindowNumber' },
    { '<LEADER>bq', '<CMD>BufferClose<CR>', desc = 'Close Current Buffer' },
    { '<LEADER>bQ', '<CMD>BufferCloseAllButCurrent<CR>', desc = 'Close All Buffer Except Current' },
  },
  dependency = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- Taken from https://github.com/romgrk/barbar.nvim/issues/355 --
    local function is_neotree_open()
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), 'ft') == 'neo-tree' then
          return require('bufferline.api').set_offset(40, 'FileTree')
        end
      end
      return require('bufferline.api').set_offset(0)
    end

    vim.api.nvim_create_autocmd({
      'BufWinEnter',
      'BufWipeout',
    }, {
      pattern = '*',
      callback = function()
        is_neotree_open()
      end,
    })
  end,
}
