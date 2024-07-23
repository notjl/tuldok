local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- remap <SPACE> (more accessible) as <LEADER>
map('', '<SPACE>', '<NOP>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- create table for keybindings
-- [MODE] {LHS} {RHS} <OPTIONS>
local keybindings = {

  -- [NORMAL] --
  ['n'] = {
    -- replace "all" shortcut --
    ['<S-s>'] = ':%s//g<LEFT><LEFT>',

    -- remap saving --
    ['<LEADER>w'] = '<CMD>w<CR>',

    -- remap quitting --
    ['<LEADER>q'] = '<CMD>q<CR>',
    ['<LEADER>Qa'] = '<CMD>qa<CR>',

    -- split navigation --
    ['<C-h>'] = '<C-w>h',
    ['<C-j>'] = '<C-w>j',
    ['<C-k>'] = '<C-w>k',
    ['<C-l>'] = '<C-w>l',

    -- split creation --
    ['<LEADER>sv'] = ':vsplit<CR><C-w>w',
    ['<LEADER>ss'] = ':split<CR><C-w>w',

    -- resize splits with arrow --
    ['<C-Up>'] = '<C-w>+',
    ['<C-Down>'] = '<C-w>-',
    ['<C-Left>'] = '<C-w><',
    ['<C-Right>'] = '<C-w>>',

    -- buffer navigation --
    -- ['<S-l>'] = ':bn<CR>',
    -- ['<S-h>'] = ':bp<CR>',

    -- do not yank with x --
    ['x'] = '"_x',

    -- increment/decrement --
    ['+'] = '<C-a>',
    ['-'] = '<C-x>',

    -- delete a word backwards --"
    ['dw'] = 'vb"_d',

    -- trouble shortcuts --
    -- ["<LEADER>xx"] = ":TroubleToggle<CR>",
    -- ["<LEADER>xw"] = ":TroubleToggle<CR>",
    -- ["<LEADER>xd"] = "TroubleToggle<CR>",

    -- format shortcut --
    ['<LEADER><S-f>'] = ':Format<CR>',
  },

  -- [INSERT] --
  ['i'] = {
    -- exit insert mode --
    ['jj'] = '<ESC>',
  },

  -- [VISUAL] --
  ['v'] = {
    -- stay in indent mode --
    ['<'] = '<gv',
    ['>'] = '>gv',

    -- move text up and down --
    ['<A-k>'] = ':m .-2<CR>==',
    ['<A-j>'] = ':m .+1<CR>==',
  },

  -- [VISUAL BLOCK] --
  ['x'] = {
    -- move text up and down --
    ['<A-j>'] = ":m '>+1<CR>gv-gv",
    ['<A-k>'] = ":m '<-2<CR>gv-gv",
  },
}

-- iterate through the keybindings
for mode, keybinds in pairs(keybindings) do
  for lhs, rhs in pairs(keybinds) do
    map(mode, lhs, rhs, opts)
  end
end
