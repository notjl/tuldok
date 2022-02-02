vim.g.material_style = 'deep ocean'
require('material').setup({
    contrast = {
        sidebars = true,
        floating_windows = true,
        non_current_windows = true,
        popup_menu = true,
    },
    italics = {
        comments = true,
        functions = true,
        keywords = true,
    },
})
vim.api.nvim_command('colo material')
