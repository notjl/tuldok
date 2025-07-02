return {
  'stevearc/conform.nvim',
  dependencies = {
    'zapling/mason-conform.nvim',
  },
  opts = {
    formatters = {
      stylua = {
        prepend_args = {
          '--indent-type',
          'Spaces',
          '--indent-width',
          '2',
          '--quote-style',
          'AutoPreferSingle',
        },
      }
    },
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
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  },
}
