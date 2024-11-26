return {
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
}
