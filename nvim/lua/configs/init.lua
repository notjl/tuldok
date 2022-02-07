-- Set shell to for <ter> or external commands
if vim.fn.has('win32') or vim.fn.has('win64') then
    vim.opt.sh = 'cmd.exe'
else
    vim.opt.sh = 'sh'
end

-- Setup notification popups
notif_ok, vim.notify = pcall(require, "notify")
require('notify').setup({
    stages='slide',
    minimum_width=30
})

-- Declare table for pcalls
local oks = {
    ['Impatient'] = pcall(require, 'configs.impatient'),
    ['Compiled'] = pcall(require, 'packer_compiled'),
    ['Options'] = pcall(require, 'configs.options'),
    ['Keymaps'] = pcall(require, 'configs.keymaps'),
    ['AutoCMD'] = pcall(require, 'configs.autocmd'),
    ['Plugins'] = pcall(require, 'configs.plugins'),
    ['Colorscheme'] = pcall(require, 'configs.colorscheme'),
    ['Presence'] = pcall(require, 'configs.presence'),
    ['CMP'] = pcall(require, 'configs.cmp'),
    ['LSP'] = pcall(require, 'configs.lsp'),
    ['Telescope'] = pcall(require, 'configs.telescope'),
}

-- Iterate through tables and if status is not ok, notify user
for name, item in pairs(oks) do
    local ok, _ = item
    if not ok and notif_ok then
        vim.notify(name .. " failed", "error", {title=name .. ".lua",render="minimal"})
    end
end
