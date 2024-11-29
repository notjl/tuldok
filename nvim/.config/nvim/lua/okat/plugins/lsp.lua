return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('okat.plugins.lsp_settings.lsp_handler').setup()
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
        }
      },
      opts = {
        -- TODO: add css_variables, cssls, css_modules
        ensure_installed = { 'bashls', 'clangd', 'cssls', 'dockerls', 'gopls',
        'html', 'ts_ls', 'jsonls', --[[ 'nil_ls' ]] 'ruff', 'rust_analyzer', 'zls'},
        handlers = {
          function(server_name)
            local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
            if not status_ok then
              return
            end

            local status_ok, illuminate = pcall(require, 'illuminate')
            if not status_ok then
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

            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                illuminate.on_attach(client)
              end,
          })
          end,

          ['lua_ls'] = function()
            local lspconfig = require('lspconfig')
            local opts = require('okat.plugins.lsp_settings.lua_ls')
            lspconfig.lua_ls.setup(opts)
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

}
