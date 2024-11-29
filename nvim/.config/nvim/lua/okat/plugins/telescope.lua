return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  cmd = 'Telescope',
  -- I opted for the command-line sugar instead of lua functions since it doesn't
  -- get lazy loaded when using lua functions
  keys = {
    { '<LEADER>tg', '<CMD>Telescope live_grep<CR>', desc = 'Telescope Live Grep' },
    { '<LEADER>tf', '<CMD>Telescope find_files<CR>', desc = 'Telescope Find Files' },
    { '<LEADER>tb', '<CMD>Telescope buffers<CR>', desc = 'Telescope Buffers' },
    { '<LEADER>th', '<CMD>Telescope help_tags<CR>', desc = 'Telescope Help Tags' },
    { '<LEADER>tr', '<CMD>Telescope lsp_references<CR>', desc = 'Telescope LSP References' },
    { '<LEADER>td', '<CMD>Telescope diagnostics<CR>', desc = 'Telescope Diagnostics' },
    { '<LEADER>ti', '<CMD>Telescope lsp_implementations<CR>', desc = 'Telescope LSP Implementations' },
    { '<LEADER>tD', '<CMD>Telescope lsp_definitions<CR>', desc = 'Telescope LSP Definitions' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    {
      'nvim-telescope/telescope-media-files.nvim',
      dependencies = {
        'nvim-lua/popup.nvim',
      },
    },
  },
  opts = {
    defaults = {
      prompt_prefix = ' ',
      selection_caret = ' ',
      path_display = { 'smart' },
    },
    pickers = {
      find_files = { theme = 'dropdown' },
      live_grep = { theme = 'dropdown' },
      buffers = { theme = 'dropdown' },
      help_tags = { theme = 'dropdown' },
      lsp_references = { theme = 'dropdown' },
      diagnostics = { theme = 'dropdown' },
      lsp_implementations = { theme = 'dropdown' },
      lsp_definitions = { theme = 'dropdown' },
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('media_files')
  end
}
