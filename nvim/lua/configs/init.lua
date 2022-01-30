-- Set shell to for <ter> or external commands
if vim.fn.has('win32') or wim.fn.has('win64') then
    vim.opt.sh = 'cmd.exe'
else
    vim.opt.sh = 'sh'
end

-- Use protected call to except faulty configs
local options_ok, _ = pcall(require, "configs.options")
local keymaps_ok, _ = pcall(require, "configs.keymaps")

if not options_ok then
    vim.notify("Options ❌")
else
    vim.notify("Options ⭕")
end

if not keymaps_ok then
    vim.notify("Keymaps ❌")
else
    vim.notify("Keymaps ⭕")
end
