return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    plugins = {
      spelling = true,
    },
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)

    -- NORMAL MODE --
    wk.register({
      ['<LEADER>'] = {
        -- barbar.nvim --
        b = { name = '+Buffer' },

        -- Comment.nvim --
        c = { name = '+Comment' },

        -- Neotree --
        e = { name = '+Neotree', e = { name = 'Toggle Neotree' } },

        -- Gitsigns.nvim --
        g = { name = '+Gitsigns Actions', t = { '+Toggle Actions' } },

        -- LSP --
        l = { name = '+LSP', r = { name = '+Rename' } },

        -- Split Creation --
        s = { name = '+Split', v = { name = 'Vertical' }, s = { name = 'Split' } },

        -- telescope.nvim --
        t = { name = '+Telescope' },

        -- twilight --
        T = { name = 'Twilight' },

        w = { 'Write File' },

        q = { name = 'Quit' },

        Q = { name = '+Quit', a = { 'Quit All' } },

        -- Surround --
        ['<S-s>'] = {
          name = '+Surround',
          a = { 'Add' },
          d = { 'Delete' },
          f = { 'Find' },
          F = { 'Find Left' },
          h = { 'Highlight' },
          r = { 'Replace' },
          n = { 'Update <N> Lines' },
        },

        ['<S-f>'] = { name = 'Format' },
      },
    }, { mode = 'n' })

    -- VISUAL MODE --
    wk.register({
      ['<LEADER>'] = { g = { name = '+Gitsigns Actions' } },
    }, { mode = 'v' })
  end,
}
