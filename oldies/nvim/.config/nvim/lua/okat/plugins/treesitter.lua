return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',
  version = false,
  dependencies = {
    'mrjones2014/nvim-ts-rainbow',
  },
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
    autopairs = {
      enable = true,
    },
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
    rainbow = {
      enable = true,
      extended_mode = true,
      max_fine_lines = nil,
    },
    illuminate = {
      enable = false,
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
