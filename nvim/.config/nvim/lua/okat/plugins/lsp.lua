return {
  'junnplus/lsp-setup.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    { '<LEADER>ld', '<CMD>lua vim.lsp.buf.definition()<CR>', desc = 'Definition' },
    { '<LEADER>lD', '<CMD>lua vim.lsp.buf.declaration()<CR>', desc = 'Declaration' },
    { '<LEADER>lk', '<CMD>lua vim.lsp.buf.hover()<CR>', desc = 'Hover' },
    { '<LEADER>li', '<CMD>lua vim.lsp.buf.implementation()<CR>', desc = 'Implementation' },
    { '<LEADER>l<C-k>', '<CMD>lua vim.lsp.buf.signature_help()<CR>', desc = 'Signature Help' },
    -- { '<LEADER>lrn', '<CMD>lua vim.lsp.buf.rename()<CR>', desc = 'Rename' },
    { '<LEADER>lr', '<CMD>lua vim.lsp.buf.references()<CR>', desc = 'References' },
    { '<LEADER>lc', '<CMD>lua vim.lsp.buf.code_action()<CR>', desc = 'Code Action' },
    { '<LEADER>lf', '<CMD>lua vim.diagnostic.open_float()<CR>', desc = 'Open Float Diagnostic' },
    { '<LEADER>l[', '<CMD>lua vim.diagnostic.goto_prev { border = "rounded" }<CR>', desc = 'Previous Diagnostic' },
    { '<LEADER>l]', '<CMD>lua vim.diagnostic.goto_next { border = "rounded" }<CR>', desc = 'Next Diagnostic' },
    { '<LEADER>l<C-d>', '<CMD>lua vim.diagnostic.setloclist()<CR>', desc = 'Set Loc List' },
  },
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'RRethy/vim-illuminate',
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if not status_ok then
      return
    end

    local status_ok, illuminate = pcall(require, 'illuminate')
    if not status_ok then
      return
    end

    local function lsp_keymaps(bufnr)
      local opts = { noremap = true, silent = true }
      vim.cmd(
        [[ command! Format execute 'lua vim.lsp.buf.format { async = true, filter = function(client) return client.name == "null-ls" end }' ]]
      )
    end

    require('lsp-setup').setup({
      on_attach = function(client, bufnr)
        lsp_keymaps(bufnr)
        illuminate.on_attach(client)
      end,

      capabilities = cmp_nvim_lsp.default_capabilities(capabilities),

      servers = {
        pylsp = {},

        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  'vim',
                },
              },
            },
          },
        },
      },
    })
    require('okat.handlers').setup()
  end,
}
