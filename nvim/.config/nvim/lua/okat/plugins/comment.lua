return {
  'numToStr/Comment.nvim',
  keys = {
    { '<LEADER>b', mode = 'v', desc = 'Block Comment' },
    { '<LEADER>c', mode = 'v', desc = 'Line Comment' },
    { '<LEADER>cc', mode = 'n', desc = 'Line Comment Toggle' },
    { '<LEADER>c0', mode = 'n', desc = 'Line Comment Above' },
    { '<LEADER>co', mode = 'n', desc = 'Line Comment Below' },
    { '<LEADER>cA', mode = 'n', desc = 'Comment End of the Line' },
    { '<LEADER>cb', mode = 'n', desc = 'Block Comment Toggle' },
  },
  config = function()
    require('Comment').setup({
      ---Add a space b/w comment and the line
      padding = true,

      ---Whether the cursor should stay at its position
      sticky = true,

      ---Lines to be ignored while (un)comment
      ignore = nil,

      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        ---Line-comment toggle keymap
        line = '<LEADER>cc',
        ---Block-comment toggle keymap
        block = '<LEADER>bc',
      },

      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = '<LEADER>c',
        ---Block-comment keymap
        block = '<LEADER>b',
      },

      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = '<LEADER>cO',
        ---Add comment on the line below
        below = '<LEADER>co',
        ---Add comment at the end of line
        eol = '<LEADER>cA',
      },

      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },

      ---Function to call before (un)comment
      pre_hook = nil,
      ---Function to call after (un)comment
      post_hook = nil,
    })
  end,
}
