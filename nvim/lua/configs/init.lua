-- Set shell to for <ter> or external commands
if vim.fn.has('win32') or wim.fn.has('win64') then
    vim.opt.sh = 'cmd.exe'
else
    vim.opt.sh = 'sh'
end

-- Use protected call to except faulty configs
local impatient_ok, _ = pcall(require, 'impatient')
local options_ok, _ = pcall(require, "configs.options")
local keymaps_ok, _ = pcall(require, "configs.keymaps")
local autocmd_ok, _ = pcall(require, "configs.autocmd")
local plugins_ok, _ = pcall(require, "configs.plugins")
local colo_ok, _ = pcall(require, "configs.colorscheme")
notif_ok, vim.notify = pcall(require, "notify")

if not notif_ok then
    return
else
    require('notify').setup({
        stages='slide',
        minimum_width=30
    })

    if not impatient_ok then
        vim.notify("Impatient failed", "error", {title = 'Impatient Plugin'})
    else
        vim.notify("Impatient loaded", 'info', {title='Impatient Plugin'})
        local compiled_ok, _ = pcall(require, 'packer_compiled')
        if not compiled_ok then
            vim.notify('Compiled failed', 'error', {title = 'Compiled'})
        else
            vim.notify('Compiled loaded', 'info', {title='Compiled'})
        end
    end
    
    if not options_ok then
        vim.notify("Options failed", 'error', {title='Options.lua'})
    else
        vim.notify("Options loaded", 'info', {title='Options.lua'})
    end
    
    if not keymaps_ok then
        vim.notify("Keymaps failed", 'error', {title='Keymaps.lua'})
    else
        vim.notify("Keymaps loaded", 'info', {title='Keymaps.lua'})
    end
    
    if not autocmd_ok then
        vim.notify("AutoCMD failed", 'error', {title='AutoCMD.lua'})
    else
        vim.notify("AutoCMD loaded", 'info', {title='AutoCMD.lua'})
    end
    
    if not plugins_ok then
        vim.notify("Plugins failed", 'error', {title='Plugins.lua'})
    else
        vim.notify("Plugins loaded", 'info', {title='Plugins.lua'})
    end
    
    if not colo_ok then
        vim.notify("Colorscheme failed", 'error', {title='Colorscheme.lua'})
    else
        vim.notify("Colorscheme loaded", 'info', {title='Colorscheme.lua'})
    end
end
