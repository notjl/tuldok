-- TODO: Fix LSP Signature Help to use blink.cmp

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
    texthl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
      [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
      [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
      [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
    },
  },
})

return {
  {
    'mason-org/mason-lspconfig.nvim',
    lazy = false,
    dependencies = {
      {
        'mason-org/mason.nvim',
        lazy = false,
        opts = {}
      },
      { 'neovim/nvim-lspconfig' },
    },
    opts = {
      ensure_installed = {
        -- LSP
        'angularls',
        'basedpyright',
        'bashls',
        'clangd',
        'dockerls',
        'gopls',
        'lua_ls',
        'html',
        'ts_ls',
        'jsonls',
        'ruff',
        'rust_analyzer',
        'tailwindcss',
        'zls',

        -- Formatting / conform.nvim
        
        -- Linting / nvim-lint
        
        -- DAP / nvim-dap
      }
    },
  },
  {
    "jinzhongjia/LspUI.nvim",
    dependencies = {
      'MeanderingProgrammer/render-markdown.nvim',
    },
    event = 'LspAttach',
    branch = "main",
    opts = {},
  },
  {
    'RRethy/vim-illuminate',
    event = 'LspAttach'
  }
}
