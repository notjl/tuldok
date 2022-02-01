local colorscheme = 'tokyonight'
local cmd = vim.api.nvim_command
local g = vim.g

local colo_ok, _ = pcall(cmd, "colo " .. colorscheme)
if not colo_ok then
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
else
    g.tokyonight_style = 'night'
    g.tokyonight_italic_functions = true
    g.tokyonight_italic_comments = true
    g.tokyonight_italic_keywords = true

    -- re-require
    cmd('colo ' .. colorscheme)
    vim.notify('Colorscheme loaded!')
end
