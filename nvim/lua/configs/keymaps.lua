local opts = {noremap=true, silent=true}
local map = vim.api.nvim_set_keymap

-- remap Space (more accessible) as <LEADER>
map("", "<SPACE>", "<NOP>", opts)
vim.g.mapleader = " "

-- create table for keybindings
-- [MODE] {LHS} {RHS} <OPTIONS>
local keybinding = {
    -- [NORMAL] --
    ["n"] = {
        -- replace all shortcut --
        ["<S-s>"] = ":%s//g<LEFT><LEFT>",
        -- remap saving --
        ["<LEADER>w"] = ":w<CR>",
        -- remap quitting --
        ["<LEADER>q"] = ":Bdelete<CR>",
        ["<LEADER>Q"] = ":q<CR>",
        ["<LEADER>qa"] = ":qa<CR>",
        -- split navigation --
        ["<C-h>"] = "<C-w>h",
        ["<C-j>"] = "<C-w>j",
        ["<C-k>"] = "<C-w>k",
        ["<C-l>"] = "<C-w>l",
        -- open explorer --
        -- ["<LEADER>e"] = ":Lex 30<CR>",
        ["<LEADER>e"] = ":NvimTreeToggle<CR>",
        -- resize splits with arrow --
        ["<C-Up>"] = ":res +5<CR>",
        ["<C-Down>"] = ":res -5<CR>",
        ["<C-Left>"] = ":vert res -5<CR>",
        ["<C-Right>"] = ":vert res +5<CR>",
        -- buffer navigation --
        ["<S-l>"] = ":bn<CR>",
        ["<S-h>"] = ":bp<CR>",
        -- telescope shortcuts --
        ["<LEADER>f"] = ":Telescope find_files<CR>",
        ["<C-t>"] = ":Telescope live_grep<CR>",
    },
    -- [INSERT] --
    ["i"] =  {
        -- exit insert
        ["jj"] = "<ESC>",
    },
    -- [VISUAL] --
    ["v"] =  {
        -- stay in indent mode
        ["<"] = "<gv",
        [">"] = ">gv",
        -- move text up and down
        ["<A-k>"] = ":m .-2<CR>==",
        ["<A-j>"] = ":m .+1<CR>==",
    },
    -- [VISUAL BLOCK] --
    ["x"] = {
        -- move text up and down
        ["<A-j>"] = ":m '>+1<CR>gv-gv",
        ["<A-k>"] = ":m '<-2<CR>gv-gv",
    },
}

-- iterate thru the keybindings
for mode, keybinds in pairs(keybinding) do
    for lhs, rhs in pairs(keybinds) do
        map(mode, lhs, rhs, opts)
    end
end
