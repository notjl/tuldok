return {
  'saghen/blink.cmp',
  event = { 'InsertEnter' },
  version = '*',
  dependencies = {
    'onsails/lspkind.nvim',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      dependencies = {
        'rafamadriz/friendly-snippets',
        "stevearc/vim-vscode-snippets",
      },
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end
    },
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = { enabled = true },

    snippets = { preset = 'luasnip' },

    sources = {
      default = { 'lsp', 'snippets', 'buffer', 'path',  },
    },

    appearance = {
      nerd_font_variant = 'normal'
    },

    completion = {
      keyword = { range = 'full' },

      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        }
      },

      documentation = {
        auto_show = true,
        window = {
          border = 'rounded',
        }
      },

      menu = {
        border = 'rounded',
        draw = {
          columns = {
              { "label" }, { "kind_icon", "kind" }, { "source_name" },
          },
          components = {
            label = {
                text = function(ctx)
                    return ctx.label
                end,
                highlight = "CmpItemAbbr",
            },

            kind_icon = {
                text = function(ctx)
                    local kind = require("lspkind").symbol_map[ctx.kind] or ""
                    return kind .. " "
                end,
                highlight = "CmpItemKind",
            },

            kind = {
                text = function(ctx)
                    return ctx.kind
                end,
                highlight = "CmpItemKind",
            },

            source_name = {
              text = function(ctx)
                return string.format("[%s]", ctx.source_name)
              end
            }
          },
        },
      }
    },

    keymap = {
      preset = 'default',

      ['<C-y>'] = false,
      ['<C-Space>'] = false,
      ['<C-p>'] = false,
      ['<C-n>'] = false,

      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-b>'] = { function(cmp) cmp.scroll_documentation_up(1) end, 'fallback' },
      ['<C-f>'] = { function(cmp) cmp.scroll_documentation_down(1) end, 'fallback' },
      ['<A-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'cancel', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then return cmp.accept()
          else return cmp.select_and_accept() end
        end,
        'snippet_forward',
        'fallback',
      },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    },

    cmdline = {
      keymap = { preset = 'inherit' },
      completion = {
        menu = { auto_show = true },
        ghost_text = { enabled = true },
    },
    },
  },
  opts_extend = { "sources.default" }
}
