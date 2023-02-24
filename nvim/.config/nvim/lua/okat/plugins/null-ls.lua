return {
  'jose-elias-alvarez/null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = function()
    local ok, null_ls = pcall(require, 'null-ls')
    if not ok then
    end

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    return {
      debug = false,
      sources = {
        -- TODO
        -- Make sure to have formatting and diagnostics installed using
        -- your prefered package manager.
        formatting.stylua.with({
          extra_args = {
            '--indent-type',
            'Spaces',
            '--indent-width',
            '2',
            '--quote-style',
            'AutoPreferSingle',
          },
        }),

        formatting.gofmt,
      },
    }
  end,
}
