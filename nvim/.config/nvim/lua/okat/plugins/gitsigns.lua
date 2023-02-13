return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  keys = {
    { '<LEADER>g]', '<CMD>Gitsigns next_hunk<CR>', desc = 'Next Hunk' },
    { '<LEADER>g[', '<CMD>Gitsigns prev_hunk<CR>', desc = 'Previous Hunk' },
    { '<LEADER>gs', '<CMD>Gitsigns stage_hunk<CR>', desc = 'Stage Hunk' },
    { '<LEADER>gS', '<CMD>Gitsigns stage_buffer<CR>', desc = 'Stage Buffer' },
    { '<LEADER>gr', '<CMD>Gitsigns reset_hunk<CR>', desc = 'Reset Hunk' },
    { '<LEADER>gR', '<CMD>Gitsigns reset_buffer<CR>', desc = 'Reset Buffer' },
    { '<LEADER>gu', '<CMD>Gitsigns undo_stage_hunk<CR>', desc = 'Undo Stage Hunk' },
    { '<LEADER>gp', '<CMD>Gitsigns preview_hunk<CR>', desc = 'Preview Hunk' },
    { '<LEADER>gb', '<CMD>lua require("gitsigns").blame_line {full=true}<CR>', desc = 'Blame Line' },
    { '<LEADER>gd', '<CMD>Gitsigns diffthis<CR>', desc = 'Diff This' },
    { '<LEADER>gD', '<CMD>lua require("gitsigns").diffthis("~")<CR>', desc = 'Diff This ("~")' },
    { '<LEADER>gtb', '<CMD>Gitsigns toggle_current_lime_blame<CR>', desc = 'Toggle Current Line Blame' },
    { '<LEADER>gtd', '<CMD>Gitsigns toggle_deleted<CR>', desc = 'Toggle Deleted' },
    { '<LEADER>gs', '<CMD>Gitsigns stage_hunk<CR>', desc = 'Stage Hunk', mode = 'v' },
    { '<LEADER>gr', '<CMD>Gitsigns reset_hunk<CR>', desc = 'Reset Hunk', mode = 'v' },
    { 'ih', '<CMD><C-U>Gitsigns select_hunk<CR>', desc = 'Select Hunk', mode = 'o' },
    { 'ih', '<CMD><C-U>Gitsigns select_hunk<CR>', desc = 'Select Hunk', mode = 'x' },
  },
  config = function()
    require('gitsigns').setup({
      signs = {
        add = {
          hl = 'GitSignsAdd',
          text = '▎',
          numhl = 'GitSignsAddNr',
          linehl = 'GitSignsAddLn',
        },
        change = {
          hl = 'GitSignsChange',
          text = '▎',
          numhl = 'GitSignsChangeNr',
          linehl = 'GitSignsChangeLn',
        },
        delete = {
          hl = 'GitSignsDelete',
          text = '契',
          numhl = 'GitSignsDeleteNr',
          linehl = 'GitSignsDeleteLn',
        },
        topdelete = {
          hl = 'GitSignsDelete',
          text = '契',
          numhl = 'GitSignsDeleteNr',
          linehl = 'GitSignsDeleteLn',
        },
        changedelete = {
          hl = 'GitSignsChange',
          text = '▎',
          numhl = 'GitSignsChangeNr',
          linehl = 'GitSignsChangeLn',
        },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = false,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    })
  end,
}
