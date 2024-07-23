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
    require('gitsigns').setup {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },

      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        follow_files = true
      },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false
      },
    }
  end,
}
