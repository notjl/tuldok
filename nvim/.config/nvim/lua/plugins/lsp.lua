-- TODO LSP Keymaps (either through plugins or native)

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
        'angularls',        -- AngularJS
        'basedpyright',     -- Python
        'bashls',           -- Bash
        'clangd',           -- C / C++
        'dockerls',         -- Docker
        'gopls',            -- Golang
        'lua_ls',           -- Lua / NVIM
        'html',             -- HTML
        'ts_ls',            -- TypeScript
        'jsonls',           -- JSON
        'ruff',             -- Python [lint, format]
        'rust_analyzer',    -- Rust
        'tailwindcss',      -- Tailwind CSS
        'zls',              -- Zig

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
    -- event = 'LspAttach',
    branch = "main",
    opts = {},
  },
  {
    'RRethy/vim-illuminate',
    event = 'LspAttach'
  },
}
