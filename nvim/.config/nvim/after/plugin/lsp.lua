vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LSP Config', {}),
  callback = function(args)
    local capabilities = vim.tbl_deep_extend(
      'force',
      {},
      vim.lsp.protocol.make_client_capabilities()
    )

    local ok, blink = pcall(require, 'blink.cmp')
    if ok then
      capabilities = vim.tbl_deep_extend(
        'force',
        capabilities,
        blink.get_lsp_capabilities()
      )
    end

    vim.lsp.config('*', {
      capabilities = capabilities
    })

    vim.keymap.set('n', '<LEADER>ll', function()
      local curr_config = vim.diagnostic.config()
      local new_virtual_line_state

      if curr_config.virtual_lines then
        new_virtual_line_state = false
      else
        new_virtual_line_state = { current_line = true }
      end

      vim.diagnostic.config({ virtual_lines = new_virtual_line_state})
    end, { desc = 'Toggle [L]SP Current Virtual [l]ine' })

    vim.keymap.set('n', '<LEADER>lL', function()
      local new_config = not vim.diagnostic.config().virtual_lines
      vim.diagnostic.config({ virtual_lines = new_config })
    end, { desc = 'Toggle [L]SP Virtual [L]ines' })


  end,
})

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
