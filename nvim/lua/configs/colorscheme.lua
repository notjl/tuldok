local colorscheme = 'material'
local cmd = vim.api.nvim_command
local g = vim.g

local colo_ok, _ = pcall(cmd, "colo " .. colorscheme)
if not colo_ok then
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
else
    -- Tokyonight
    if colorscheme == 'tokyonight' then
        g.tokyonight_style = 'night'
        g.tokyonight_italic_functions = true
        g.tokyonight_italic_comments = true
        g.tokyonight_italic_keywords = true
    end

    -- Material
    if colorscheme == 'material' then
        g.material_style = 'deep ocean'
        require('material').setup({
            contrast = {
                sidebars = true,
                floating_windows = true,
                non_current_windows = true,
                popup_menu = true
            },
            italics = {
                comments=true,
                functions=true,
                keywords=true
            },
            high_visibility = {
                -- darker = true
            },
        })
    end

    -- re-require
    cmd('colo ' .. colorscheme)
end
