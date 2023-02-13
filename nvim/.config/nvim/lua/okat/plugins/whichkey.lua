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
        l = { name = '+LSP' },

        -- Split Creation --
        s = { name = '+Split', v = { name = 'Vertical' }, s = { name = 'Split' } },

        -- telescope.nvim --
        t = { name = '+Telescope' },

        w = { 'Write File' },

        Q = { name = '+Quit', a = { 'Quit All' } },

        ['<S-f>'] = { name = 'Format' },
      },

      -- Surround --
      s = {
        name = '+Surround',
        a = { 'Add' },
        d = { 'Delete' },
        f = { 'Find' },
        F = { 'Find Left' },
        h = { 'Highlight' },
        r = { 'Replace' },
        n = { 'Update <N> Lines' },
      },
    }, { mode = 'n' })

    -- VISUAL MODE --
    wk.register({
      ['<LEADER>'] = { g = { name = '+Gitsigns Actions' } },
    }, { mode = 'v' })
  end,
}
