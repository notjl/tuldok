return {
  'nvim-telescope/telescope.nvim',
  keys = {
    { '<LEADER>tg', '<CMD>Telescope live_grep<CR>', desc = 'Live Grep' },
    { '<LEADER>tf', '<CMD>Telescope find_files theme=dropdown<CR>', desc = 'Find Files' },
    { '<LEADER>tb', '<CMD>Telescope buffers<CR>', desc = 'Buffers' },
    { '<LEADER>th', '<CMD>Telescope help_tags<CR>', desc = 'Help Tags' },
    { '<LEADER>tr', '<CMD>Telescope lsp_references<CR>', desc = 'LSP References' },
    { '<LEADER>td', '<CMD>Telescope diagnostics<CR>', desc = 'Diagnostics' },
    { '<LEADER>ti', '<CMD>Telescope lsp_implementations<CR>', desc = 'LSP Implementations' },
    { '<LEADER>tD', '<CMD>Telescope lsp_definitions<CR>', desc = 'LSP Definitions' },
  },
  version = '0.1.x',
  lazy = true,
  cmd = 'Telescope',
  dependencies = {
    'nvim-telescope/telescope-media-files.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  opts = function()
    local status_ok, telescope = pcall(require, 'telescope')
    if not status_ok then
      return
    end

    telescope.load_extension('media_files')
    telescope.load_extension('fzf')

    local actions = require('telescope.actions')

    return {
      defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        path_display = { 'smart' },

        mappings = {
          i = {
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,

            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,

            ['<C-c>'] = actions.close,

            ['<Down>'] = actions.move_selection_next,
            ['<Up>'] = actions.move_selection_previous,

            ['<CR>'] = actions.select_default,
            ['<C-x>'] = actions.select_horizontal,
            ['<C-v>'] = actions.select_vertical,
            ['<C-t>'] = actions.select_tab,

            ['<C-u>'] = actions.preview_scrolling_up,
            ['<C-d>'] = actions.preview_scrolling_down,

            ['<PageUp>'] = actions.results_scrolling_up,
            ['<PageDown>'] = actions.results_scrolling_down,

            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
            ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
            ['<C-l>'] = actions.complete_tag,
            ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
          },

          n = {
            ['<esc>'] = actions.close,
            ['<CR>'] = actions.select_default,
            ['<C-x>'] = actions.select_horizontal,
            ['<C-v>'] = actions.select_vertical,
            ['<C-t>'] = actions.select_tab,

            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
            ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
            ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

            ['j'] = actions.move_selection_next,
            ['k'] = actions.move_selection_previous,
            ['H'] = actions.move_to_top,
            ['M'] = actions.move_to_middle,
            ['L'] = actions.move_to_bottom,

            ['<Down>'] = actions.move_selection_next,
            ['<Up>'] = actions.move_selection_previous,
            ['gg'] = actions.move_to_top,
            ['G'] = actions.move_to_bottom,

            ['<C-u>'] = actions.preview_scrolling_up,
            ['<C-d>'] = actions.preview_scrolling_down,

            ['<PageUp>'] = actions.results_scrolling_up,
            ['<PageDown>'] = actions.results_scrolling_down,

            ['?'] = actions.which_key,
          },
        },
      },

      extensions = {
        media_files = {
          filetypes = { 'png', 'webp', 'jpg', 'jpeg' },
          find_cmd = 'rg', -- find command (defaults to `fd`)
        },
      },
    }
  end,
}
