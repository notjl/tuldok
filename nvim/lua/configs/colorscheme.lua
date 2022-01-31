local colorscheme = "ayu"
local cmd = vim.api.nvim_command

local colo_ok, _ = pcall(cmd, "colo " .. colorscheme)
if not colo_ok then
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
else
    require('ayu').setup({
        dark = true,
    })
    vim.notify('Colorscheme loaded!')
end
