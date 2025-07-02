return {
  'stevearc/conform.nvim',
  dependencies = {
    'zapling/mason-conform.nvim',
    opts = {},
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
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      python = {
        -- To fix auto-fixable lint errors.
        'ruff_fix',
        -- To run the Ruff formatter.
        'ruff_format',
        -- To organize the imports.
        'ruff_organize_imports',
      },
      go = { 'gofumpt', 'goimports-reviser', 'golines' },
      javascript = { 'prettierd' },
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
