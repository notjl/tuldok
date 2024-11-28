return {
  'neovim/nvim-lspconfig',
  config = function()
    local signs = {
      { name = 'DiagnosticSignError', text = '' },
      { name = 'DiagnosticSignWarn', text = '' },
      { name = 'DiagnosticSignHint', text = '' },
      { name = 'DiagnosticSignInfo', text = '' },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        numhl = ''
    })
    end

    local config = {
      virtual_text = false,
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    }
    vim.diagnostic.config(config)

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'rounded',
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = 'rounded',
    })
  end,

  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {},
      },
      'RRethy/vim-illuminate',
    },
    opts = {
      ensure_installed = { 'lua_ls' },
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

}
