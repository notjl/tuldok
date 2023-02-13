return {
  'junnplus/lsp-setup.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'RRethy/vim-illuminate',

    -- Trouble Plugin --
    {
      'folke/trouble.nvim',
      cmd = 'Trouble',
      dependencies = {
        'nvim-tree/nvim-web-devicons',
      },
      config = function()
        require('trouble').setup({})
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
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      vim.api.nvim_buf_set_keymap(
        bufnr,
        'n',
        '[d',
        '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
        opts
      )
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      vim.api.nvim_buf_set_keymap(
        bufnr,
        'n',
        ']d',
        '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
        opts
      )
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
      vim.cmd(
        [[ command! Format execute 'lua vim.lsp.buf.format { async = true, filter = function(client) return client.name == "null-ls" end }' ]]
      )
    end

    require('lsp-setup').setup({
      on_attach = function(client, bufnr)
        -- if client.name == "lua_ls" then
        --   client.server_capabilities.documentFormattingProvider = false
        -- end
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
