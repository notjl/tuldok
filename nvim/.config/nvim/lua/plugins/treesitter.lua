return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    version = false,
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'diff',
        'dockerfile',
        'gitcommit',
        'gitignore',
        'go',
        'rust',
        'html',
        'json',
        'lua',
        'python',
        'regex',
        'rust',
        'sql',
        'markdown',
        'markdown_inline',
      },
      sync_install = false,
      ignore_install = { '' },
      highlight = {
        enable = true,
        disable = { '' },
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = false,
        disable = {
          'yaml',
        },
      },
      illuminate = {
        enable = false,
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      {
        '<LEADER>[c',
        function()
          require('treesitter-context').go_to_context(vim.v.count1)
        end,
        mode = 'n',
        desc = 'Jump to Context',
      },
    },
    opts = {
      max_lines = 1,
      min_window_height = 1,
    },
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },
}
