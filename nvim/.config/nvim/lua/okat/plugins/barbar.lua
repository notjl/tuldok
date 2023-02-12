return {
  'romgrk/barbar.nvim',
  event = 'VeryLazy',
  keys = {
    { '<A-h>', '<CMD>BufferPrevious<CR>' },
    { '<A-l>', '<CMD>BufferNext<CR>' },
    { '<LEADER>q', '<CMD>BufferClose<CR>' },
  },
  config = function()
    -- Taken from https://github.com/romgrk/barbar.nvim/issues/355 --
    local function is_neotree_open()
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if
          vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), 'ft')
          == 'neo-tree'
        then
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
