return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      attach_to_untracked = true,
    },
  },
  {
    'f-person/git-blame.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {},
  },
}
