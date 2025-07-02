-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('LSP Config', {}),
--   callback = function(args)
--     local ok, blink = pcall(require, 'blink.cmp')
--     if ok then
--       vim.lsp.config('*', {
--         capabilities = vim.tbl_deep_extend(
--           "force",
--           {},
--           vim.lsp.protocol.make_client_capabilities(),
--           blink.get_lsp_capabilities(),
--           -- {
--           --   fileOperations = {
--           --       didRename = true,
--           --       willRename = true,
--           --   },
--           -- }
--         ),
--       })
--     end
--   end,
-- })
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
