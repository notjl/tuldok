-- Referenced from oldnvim and sitiom/nvim-numbertoggle --
local numbertogglegroup = vim.api.nvim_create_augroup('numbertoggle', {})
local formatgroup = vim.api.nvim_create_augroup('Format', {})
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_command
local get_mode = vim.api.nvim_get_mode

autocmd({
  'BufEnter',
  'FocusGained',
  'InsertLeave',
  'WinEnter',
}, {
  desc = 'Turn on relative number when entering buffer.',
  pattern = '*',
  group = numbertogglegroup,
  callback = function()
    if vim.o.nu and get_mode().mode ~= 'i' then
      vim.opt['rnu'] = true
    end
  end,
})

autocmd({
  'BufLeave',
  'FocusLost',
  'InsertEnter',
  'WinLeave',
}, {
  desc = 'Turn off relative number when exiting buffer.',
  pattern = '*',
  group = numbertogglegroup,
  callback = function()
    if vim.o.nu then
      vim.opt['rnu'] = false
      cmd('redraw')
    end
  end,
})

autocmd({
  'FileType',
}, {
  pattern = 'lua',
  desc = 'Set LUA filetypes to have specific tabs size',
  callback = function()
    vim.opt_local['shiftwidth'] = 2
    vim.opt_local['softtabstop'] = 2
    vim.opt_local['expandtab'] = true
  end,
})

autocmd({
  'BufWritePre',
}, {
  pattern = '*',
  desc = 'Automatically format (if configured) the file on write',
  callback = function()
    vim.lsp.buf.format({
      filter = function(client)
        return client.name == 'null-ls'
      end,
    })
  end,
})
