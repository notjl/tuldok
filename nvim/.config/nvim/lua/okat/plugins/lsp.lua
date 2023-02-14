return {
  'junnplus/lsp-setup.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    { '<LEADER>lf', '<CMD>Lspsaga lsp_finder<CR>', desc = 'Finder' },
    { '<LEADER>la', '<CMD>Lspsaga code_action<CR>', desc = 'Code Action', mode = { 'n', 'v' } },
    { '<LEADER>lrn', '<CMD>Lspsaga rename<CR>', desc = 'Rename' },
    { '<LEADER>lrN', '<CMD>Lspsaga rename ++project<CR>', desc = 'Rename (All)' },
    { '<LEADER>ld', '<CMD>Lspsaga peek_definition<CR>', desc = 'Peek Definition' },
    { '<LEADER>lD', '<CMD>Lspsaga goto_definition<CR>', desc = 'Go to Definition' },
    { '<LEADER>lt', '<CMD>Lspsaga peek_type_defintion<CR>', desc = 'Peek Type Definition' },
    { '<LEADER>lT', '<CMD>Lspsaga goto_type_definition<CR>', desc = 'Go to Type Definition' },
    { '<LEADER>ll', '<CMD>Lspsaga show_line_diagnostics<CR>', desc = 'Show Line Diagnostics' },
    { '<LEADER>lc', '<CMD>Lspsaga show_cursor_diagnostics<CR>', desc = 'Show Cursor Diagnostics' },
    { '<LEADER>lb', '<CMD>Lspsaga show_buf_diagnostics<CR>', desc = 'Show Buffer Diagnostics' },
    { '<LEADER>lo', '<CMD>Lspsaga outline<CR>', desc = 'Show Outline' },
    { '<LEADER>lk', '<CMD>Lspsaga hover_doc<CR>', desc = 'Show Hover Doc' },
    { '<LEADER>lK', '<CMD>Lspsaga hover_doc ++keep<CR>', desc = 'Show Hover Doc (Keep)' },
    { '<LEADER>l[', '<CMD>Lspsaga diagnostic_jump_prev<CR>', desc = 'Jump to Previous Diagnostic' },
    { '<LEADER>l]', '<CMD>Lspsaga diagnostic_jump_next<CR>', desc = 'Jump to Next Diagnostic' },
    {
      '<LEADER>l{',
      function()
        require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end,
      desc = 'Jump to Previous Diagnostic (ERROR)',
    },
    {
      '<LEADER>l}',
      function()
        require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end,
      desc = 'Jump to Next Diagnostic (ERROR)',
    },
  },
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'RRethy/vim-illuminate',
    {
      'glepnir/lspsaga.nvim',
      dependencies = {
        'nvim-tree/nvim-web-devicons',
      },
      config = function()
        require('lspsaga').setup({
          symbol_in_winbar = {
            enable = false,
            color_mode = false,
          },
        })
      end,
    },
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
