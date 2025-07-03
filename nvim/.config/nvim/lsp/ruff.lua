vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})

return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  settings = {
    -- Ruff language server settings go here [8, 12]
    -- Explicitly ensure Ruff handles formatting, linting, and import organization.
    -- These are typically true by default, but explicit settings improve clarity and prevent surprises.
    format = {
      enabled = true, -- Ensure Ruff's formatting capability is active [8]
    },
    lint = {
      enabled = true, -- Ensure Ruff's linting capability is active [8]
    },
    organizeImports = {
      enabled = true, -- Ensure Ruff's import organization capability is active [8]
    },
    -- Other Ruff settings can be customized here based on preferences [8]
    lineLength = 88, -- Example: Match Black's default line length [8]
    -- lint = {
    --   select = { "E4", "E7" }, -- Example: Select specific lint rules [8]
    --   preview = false,
    -- },
    -- format = {
    --   preview = true,
    -- },
    -- logLevel = 'debug', -- Uncomment for troubleshooting Ruff's behavior [12]
  },
}
