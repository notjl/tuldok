-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Check if Lazy.nvim is properly installed
local lazy_ok, lazy = pcall(require, 'lazy')
if not lazy_ok then
  return
end

lazy.setup({
  spec = {

    -- Import your plugins
    { import = 'plugins' },
  },
  -- checker = { enabled = true },
})

-- Call the colorscheme here instead of using config = function()
vim.cmd.colorscheme('catppuccin')
