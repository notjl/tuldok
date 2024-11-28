return {
  'neovim/nvim-lspconfig',
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
