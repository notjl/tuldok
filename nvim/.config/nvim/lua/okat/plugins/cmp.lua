-- Guided by https://github.com/LazyVim/LazyVim
return {
  -- CMP plugins --
  'hrsh7th/nvim-cmp',
  version = false,
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'lukas-reineke/cmp-under-comparator',
    'onsails/lspkind.nvim',
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        'rafamadriz/friendly-snippets',
      },
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
  },

  opts = function()
    local cmp_ok, cmp = pcall(require, 'cmp')
    if not cmp_ok then
      return
    end

    local snip_ok, luasnip = pcall(require, 'luasnip')
    if not snip_ok then
      return
    end

    local check_backspace = function()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
    end

    local kind_icons = {
      Text = '',
      Method = 'm',
      Function = '',
      Constructor = '',
      Field = '',
      Variable = '',
      Class = '',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '',
      Keyword = '',
      Snippet = '',
      Color = '',
      File = '',
      Reference = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = '',
      Event = '',
      Operator = '',
      TypeParameter = '',
    }

    -- cmp.setup {
    return {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For "luasnip" users.
        end,
      },

      mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify "cmp.config.disable" if you want to remove the default "<C-y>" mapping
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. if none selected, "select" first item.
        -- Set "select" to "false" to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
      },

      formatting = {
        -- fields = { "kind", "abbr", "menu" },
        fields = { 'abbr', 'kind', 'menu' },
        format = require('lspkind').cmp_format({
          mode = 'symbol_text',
          preset = 'codicons',
          maxwidth = 50,
          ellipsis_char = '...',
          before = function(entry, vim_item)
            -- kind icons
            -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = require("lspkind").presets.default[vim_item.kind]

            vim_item.menu = ({
              nvim_lsp = '[LSP]',
              nvim_lua = '[NVIM LUA]',
              luasnip = '[Snippet]',
              buffer = '[Buffer]',
              path = '[Path]',
            })[entry.source.name]
            return vim_item
          end,
        }),
        -- format = function(entry, vim_item)
        --     -- Kind icons
        --     vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        --     -- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concats the icons with the nmae of the item kind
        --
        --     vim_item.menu = ({
        --         nvim_lsp = "[LSP]",
        --         nvim_lua = "[NVIM LUA]",
        --         luasnip = "[Snippet]",
        --         buffer = "[Buffer]",
        --         path = "[Path]",
        --     })[entry.source.name]
        --     return vim_item
        -- end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        documentation = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        },
      },
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require('cmp-under-comparator').under,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    }
  end,
}
