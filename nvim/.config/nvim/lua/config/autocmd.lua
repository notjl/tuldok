local numbertogglegroup = vim.api.nvim_create_augroup('numbertoggle', {})
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
    if vim.o.nu and get_mode().node ~= 'i' then
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

-- autocmd({
--   'BufEnter',
--   'BufLeave',
-- }, {
--   desc = 'Set <LEADER>q to buffer delete and quit NeoVim',
--   pattern = '*',
--   callback = function()
--     if vim.api.nvim_get_option_value('filetype', { buf = 0 }) == '' then
--       vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
--     else
--       vim.api.nvim_set_keymap('n', '<Leader>q', ':bd<CR>', { noremap = true, silent = true })
--     end
--   end,
-- })

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
  'BufEnter',
  'BufNewFile',
  'BufWinEnter',
}, {
  pattern = { '*.md' },
  desc = 'Set MD filetypes to wrap text',
  callback = function()
    vim.opt.wrap = true
    vim.opt.tw = 80
    vim.opt.wm = 80
  end,
})
