-- [TODO fix keymaps]
return {
  'folke/which-key.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
  config = function(_, _)
    local wk = require('which-key')
    wk.setup()

    -- stylua: ignore
    wk.add({
      { '<LEADER>S', group = 'Split' },
      { '<LEADER>Sv', desc = 'Vertical' },
      { '<LEADER>Ss', desc = 'Horizontal' },

      { '<LEADER>bp', desc = 'Pin Current Buffer' },
      { '<LEADER>bP', desc = 'Magic Buffer Pick Mode' },
      { '<LEADER>bb', desc = 'Order Buffer by Buffer Number' },
      { '<LEADER>bd', desc = 'Order Buffer by Directory' },
      { '<LEADER>bl', desc = 'Order Buffer by Language' },
      { '<LEADER>bw', desc = 'Order Buffer by WindowNumber' },
      { '<LEADER>bq', desc = 'Close Current Buffer' },
      { '<LEADER>bQ', desc = 'Close All Buffer Except Current' },

      { '<LEADER>t', group = 'Telescope' },
      { '<LEADER>tg', desc = 'Live Grep' },
      { '<LEADER>tf', desc = 'Find Files' },
      { '<LEADER>tb', desc = 'Buffers' },
      { '<LEADER>th', desc = 'Help Tags' },
      { '<LEADER>tr', desc = 'LSP References' },
      { '<LEADER>td', desc = 'Diagnostics' },
      { '<LEADER>ti', desc = 'LSP Implementations' },
      { '<LEADER>tD', desc = 'LSP Definitions' },

      {
        mode = { 'n', 'v' },
        { '<LEADER>s', group = 'Surround' },
        { '<LEADER>sa', desc = 'Add' },
        { '<LEADER>sd', desc = 'Delete' },
        { '<LEADER>sf', desc = 'Find Left' },
        { '<LEADER>sF', desc = 'Find Right' },
        { '<LEADER>sh', desc = 'Highlight' },
        { '<LEADER>sr', desc = 'Replace' },
        { '<LEADER>sn', desc = 'Change # Neighbor Lines' },

        { '<LEADER>b', desc = 'Block Comment' },
        { '<LEADER>c', desc = 'Line Comment' },
      },

      {
        '<LEADER>[c',
        function()
          require('treesitter-context').go_to_context(vim.v.count1)
        end,
        group = 'Treesitter Context',
        desc = 'Treesitter Jump to Context',
      },

      { '<LEADER>c', group = 'Comment' },
      { '<LEADER>cc', desc = 'Line Comment Toggle' },
      { '<LEADER>cb', desc = 'Block Comment Toggle' },
      { '<LEADER>cO', desc = 'Line Comment Above' },
      { '<LEADER>co', desc = 'Line Comment Below' },
      { '<LEADER>cA', desc = 'Comment End of the Line' },

      { '<LEADER>l', group = 'LSP' },
      { '<LEADER>lh', desc = 'Show Hover Doc' },
      { '<LEADER>lr', desc = 'Rename' },
      { '<LEADER>lc', desc = 'Code Action' },
      { '<LEADER>lk', desc = 'Next Diagnostic' },
      { '<LEADER>lj', desc = 'Previous Diagnostic' },
      { '<LEADER>ld', desc = 'Definition' },
      { '<LEADER>lt', desc = 'Type Definition' },
      { '<LEADER>lD', desc = 'Declaration' },
      { '<LEADER>lR', desc = 'Reference' },
      { '<LEADER>li', desc = 'Implementation' },
      { '<LEADER>lI', desc = 'Inlay Hint' },
      { '<LEADER>ll', desc = 'Toggle LSP Lines' },

      { '<LEADER>T', group = 'Trouble' },
      { '<LEADER>Tx', desc = 'Toggle Diagnostic' },
      { '<LEADER>TX', desc = 'Toggle Buffer Diagnostics' },
      { '<LEADER>Ts', desc = 'Toggle Symbols' },
      { '<LEADER>Tl', desc = 'Toggle LSP definitions / references / ...' },
      { '<LEADER>TL', desc = 'Toggle Location List' },
      { '<LEADER>TQ', desc = 'Toggle Quickfix List' },

      { '<LEADER>y', group = 'Yazi', desc = 'Open Yazi at current file' },
      { '<LEADER>yw', desc = 'Open Yazi at CWD' },
      { '<LEADER>yc', desc = 'Resume the last Yazi Session' },

      { '<LEADER>ee', group = 'File Explorer', desc = 'Toggle Neotree' },

      { '<LEADER>d', group = 'DAP' },
      { '<LEADER>db', desc = 'Toggle Breakpoint' },
      { '<LEADER>dB', desc = 'Toggle Breakpoint' },
      { '<LEADER>dr', desc = 'Toggle REPL' },
      { '<LEADER>dc', desc = 'Continue' },
      { '<LEADER>dt', desc = 'Terminate' },
      { '<LEADER>dd', desc = 'Disconnect' },
      { '<LEADER>dT', desc = 'Toggle UI' },

      { '<LEADER>ds', group = 'Step' },
      { '<LEADER>dso', desc = 'Over' },
      { '<LEADER>dsO', desc = 'Out' },
      { '<LEADER>dsi', desc = 'Into' },

    })
  end,
}
