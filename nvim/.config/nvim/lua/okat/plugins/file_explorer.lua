return {

  {
  'mikavilpas/yazi.nvim',
  keys = {
    { '<LEADER>y', '<CMD>Yazi<CR>', desc = 'Open Yazi at current file' },
    { '<LEADER>yw', '<CMD>Yazi cwd<CR>', desc = 'Open Yazi at CWD' },
    { '<LEADER>yc', '<CMD>Yazi toggle<CR>', desc = 'Resume the last Yazi Session' },
  },
  opts = {
    open_for_directories = true,
    keymaps = { show_help = '<f1>' },
  }
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    keys = { { '<LEADER>ee', '<CMD>Neotree toggle<CR>', desc = 'Toggle Neotree' } },
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },

    opts = {
      close_if_last_window = true,
      window = { position = "right" },
      filesystem = {
        hijack_netrw_behavior = 'disabled',
        filtered_items = { hide_gitignored = false },
        follow_current_file = { enabled = true },
      },
    },
  }

}
