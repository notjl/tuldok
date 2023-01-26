local opts = {noremap=true, silent=true}
local map = vim.api.nvim_set_keymap

-- remap <SPACE> (more accessible) as <LEADER>
map("", "<SPACE>", "<NOP>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- create table for keybindings
-- [MODE] {LHS} {RHS} <OPTIONS>
local keybindings = {
    -- [NORMAL] --
    ["n"] = {
        -- replace "all" shortcut --
        ["<S-s>"] = ":%s//g<LEFT><LEFT>",

        -- remap saving --
        ["<LEADER>w"] = ":w<CR>",
    },
}

-- iterate through the keybindings
for mode, keybinds in pairs(keybindings) do
    for lhs, rhs in pairs(keybinds) do
        map(mode, lhs, rhs, opts)
    end
end
