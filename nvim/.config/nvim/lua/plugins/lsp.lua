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
  },
}
