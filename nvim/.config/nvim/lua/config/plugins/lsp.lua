return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('config.plugins.lsp_settings.lsp_handler').setup()
    end,

    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        {
          'williamboman/mason.nvim',
          opts = {},
        },
        {
          'RRethy/vim-illuminate',
          event = 'LspAttach',
        },
      },
      opts = {
        handlers = {
          function(server_name)
            local lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
            if not lsp_ok then
              return
            end

            local illum_ok, illuminate = pcall(require, 'illuminate')
            if not illum_ok then
              return
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- UFO Config --
            capabilities.textDocument.foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            }

            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

            require('lspconfig')[server_name].setup({
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                illuminate.on_attach(client)
              end,
            })
          end,

          ['lua_ls'] = function()
            local lspconfig = require('lspconfig')
            local opts = require('config.plugins.lsp_settings.lua_ls')
            lspconfig.lua_ls.setup(opts)
          end,

          ['ruff'] = function()
            local lspconfig = require('lspconfig')
            lspconfig.ruff.setup({
              init_options = {
                settings = {
                  -- Modification to any of these settings has no effect.
                  enable = true,
                  ignoreStandardLibrary = true,
                  organizeImports = true,
                  fixAll = true,
                  lint = {
                    enable = true,
                    run = 'onType',
                  },
                },
              },
            })
          end,
        },
      },
    },
  },

  {
    'jinzhongjia/LspUI.nvim',
    event = 'LspAttach',
    branch = 'main',
    keys = {
      { '<LEADER>lh', '<CMD>LspUI hover<CR>', desc = 'LSP Show Hover Doc' },
      { '<LEADER>lr', '<CMD>LspUI rename<CR>', desc = 'LSP Rename' },
      { '<LEADER>lc', '<CMD>LspUI code_action<CR>', desc = 'LSP Code Action' },
      { '<LEADER>lk', '<CMD>LspUI diagnostic next<CR>', desc = 'LSP Next Diagnostic' },
      { '<LEADER>lj', '<CMD>LspUI diagnostic prev<CR>', desc = 'LSP Previous Diagnostic' },
      { '<LEADER>ld', '<CMD>LspUI definition<CR>', desc = 'LSP Definition' },
      { '<LEADER>lt', '<CMD>LspUI type_definition<CR>', desc = 'LSP Type Definition' },
      { '<LEADER>lD', '<CMD>LspUI declaration<CR>', desc = 'LSP Declaration' },
      { '<LEADER>lR', '<CMD>LspUI reference<CR>', desc = 'LSP Reference' },
      { '<LEADER>li', '<CMD>LspUI implementation<CR>', desc = 'LSP Implementation' },
      { '<LEADER>lI', '<CMD>LspUI inlay_hint<CR>', desc = 'LSP Inlay Hint' },
    },
    opts = {},
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    event = 'VeryLazy',
    opts = {
      ensure_installed = {
        -- For LSP
        -- TODO: add css_variables, cssls, css_modules

        'angularls',
        'basedpyright',
        'bashls',
        'clangd',
        -- 'cssls',
        'dockerls',
        'gopls',
        'lua_ls',
        'html',
        'ts_ls',
        'jsonls',
        'nil_ls',
        'ruff',
        'rust_analyzer',
        'tailwindcss',
        'zls',

        -- For Formatting / conform.nvim
        'clang-format',
        'gofumpt',
        'goimports-reviser',
        'golines',
        'prettierd',
        'stylua',

        -- For Linting / nvim-lint
        'bacon',
        'cpplint',
        'eslint_d',
        'nilaway',
        'revive',
        -- 'selene',

        -- For DAP / nvim-dap
        'chrome-debug-adapter',
        'cpptools',
        'debugpy',
        'delve',
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        py = { 'ruff' },
        go = { 'gofumpt', 'goimports-reviser', 'golines' },
        js = { 'prettierd' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        h = { 'clang-format' },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    },
    config = function(_, opts)
      require('conform').setup(opts)
      require('conform').formatters.stylua = {
        prepend_args = {
          '--indent-type',
          'Spaces',
          '--indent-width',
          '2',
          '--quote-style',
          'AutoPreferSingle',
        },
      }
    end,
  },

  {
    'mfussenegger/nvim-lint',
    opts = {
      rs = { 'bacon' },
      c = { 'cpplint' },
      cpp = { 'cpplint' },
      h = { 'cpplint' },
      js = { 'eslint_d' },
      ts = { 'eslint_d' },
      go = { 'nilaway', 'revive' },
      py = { 'ruff' },
      -- lua = { 'selene' },
    },
    config = function(_, opts)
      require('lint').linters_by_ft = opts
      local cpplint = require('lint').linters.cpplint
      cpplint.args = {
        '--filter=-legal/copyright',
      }
      -- require('lint').linters.cpplint = {
      --   args = { '--filter=-legal/copyright' },
      --   cmd = 'linter_cmd',
      --   parser = require('lint.parser').from_errorformat(),
      -- }
      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
