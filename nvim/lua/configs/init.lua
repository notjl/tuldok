-- Set shell to for <ter> or external commands
if vim.fn.has('win32') or wim.fn.has('win64') then
    vim.opt.sh = 'cmd.exe'
else
    vim.opt.sh = 'sh'
end

require "configs.options"
require "configs.keymaps"
