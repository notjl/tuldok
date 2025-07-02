return {
  {
    'folke/trouble.nvim',
    event = 'LspAttach',
    cmd = 'Trouble',
    keys = {
      { '<LEADER>Tx', '<CMD>Trouble diagnostics toggle<CR>', desc = 'Toggle Trouble Diagnostic' },
      { '<LEADER>TX', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Toggle Trouble Buffer Diagnostics' },
      { '<LEADER>Ts', '<CMD>Trouble symbols toggle focus=false<CR>', desc = 'Toggle Trouble Symbols' },
      {
        '<LEADER>Tl',
        '<CMD>Trouble lsp toggle focus=false win.position=right<CR>',
        desc = 'Toggle Trouble LSP definitions / references / ...',
      },
      { '<LEADER>TL', '<CMD>Trouble loclist toggle<CR>', desc = 'Toggle Trouble Location List' },
      { '<LEADER>TQ', '<CMD>Trouble qflist toggle<CR>', desc = 'Toggle Trouble Quickfix List' },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  -- {
  --   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  --   event = 'LspAttach',
  --   -- stylua: ignore
  --   keys = { { '<LEADER>ll', function() require("lsp_lines").toggle() end, desc = 'Toggle LSP Lines' } },
  --   opts = {},
  -- },
}
