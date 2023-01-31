-- Referenced from oldnvim and sitiom/nvim-numbertoggle --
local augroup = vim.api.nvim_create_augroup("numbertoggle", {})
local cmd = vim.api.nvim_command

vim.api.nvim_create_autocmd(
    {
        "BufEnter", "FocusGained", "InsertLeave", "WinEnter",
    },
    {
        desc = "Turn on relative number when entering buffer.",
        pattern = "*",
        group = augroup,
        callback = function()
            if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
                vim.opt["rnu"] = true
            end
        end
    }
)

vim.api.nvim_create_autocmd(
    {
        "BufLeave", "FocusLost", "InsertEnter", "WinLeave",
    },
    {
        desc = "Turn off relative number when exiting buffer.",
        pattern = "*",
        group = augroup,
        callback = function()
            if vim.o.nu then
                vim.opt["rnu"] = false
                cmd("redraw")
            end
        end
    }
)
