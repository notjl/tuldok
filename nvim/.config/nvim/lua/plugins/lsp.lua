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
      dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
      ft = { "markdown", "LspUI_hover" },
      -- opts = { code = { style = 'language', highlight = 'none' } },
    },
    event = 'LspAttach',
    keys = {
      { '<LEADER>lh', '<CMD>LspUI hover<CR>', desc = '[L]SP Show [h]over Doc' },
      { '<LEADER>lr', '<CMD>LspUI rename<CR>', desc = '[L]SP [r]ename' },
      { '<LEADER>lc', '<CMD>LspUI code_action<CR>', desc = '[L]SP [c]ode Action' },
      { '<LEADER>lk', '<CMD>LspUI diagnostic next<CR>', desc = 'LSP Next Diagnostic' },
      { '<LEADER>lj', '<CMD>LspUI diagnostic prev<CR>', desc = 'LSP Previous Diagnostic' },
      { '<LEADER>ld', '<CMD>LspUI definition<CR>', desc = '[L]SP [d]efinition' },
      { '<LEADER>lt', '<CMD>LspUI type_definition<CR>', desc = '[L]SP [t]ype Definition' },
      { '<LEADER>lD', '<CMD>LspUI declaration<CR>', desc = '[L]SP [D]eclaration' },
      { '<LEADER>lR', '<CMD>LspUI reference<CR>', desc = '[L]SP [R]eference' },
      { '<LEADER>li', '<CMD>LspUI implementation<CR>', desc = '[L]SP [i]mplementation' },
      { '<LEADER>lI', '<CMD>LspUI inlay_hint<CR>', desc = '[L]SP [I]nlay Hint' },
    },
    branch = "main",
    opts = {},
  },
  {
    'RRethy/vim-illuminate',
    event = 'LspAttach'
  },
}
