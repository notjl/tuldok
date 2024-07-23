local opts = { noremap = true, silent = true}
local map = vim.keymap.set

map('', '<SPACE>', '<NOP>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Create Table for Keybindings
-- [MODE] {LHS} {RHS} <OPTIONS>
local keybindings = {
  -- [NORMAL] --
  ['n'] = {
    
    -- Replace "All" Shortcut --
    ['<S-s>']       =   ':%s//g<LEFT><LEFT>',
    
    -- Remap Saving --
    ['<LEADER>w'] = '<CMD>w<CR>',

    -- Remap Quit --
    ['<LEADER>q']   =   '<CMD>q<CR>',	    -- Quit single buffer
    ['<LEADER>Qa']  =   '<CMD>qa<CR>',	    -- Quit all buffers

    -- Do Not Yank with "x" --
    ['x']           =   '"_x',

    -- Increment / Decrement Value Pointed Value --
    ['+']           =   '<C-a>',
    ['-']           =   '<C-x>',

    -- Delete a Word Backwards --
    ['dw']          =   'vb"_d',

  },

  -- [INSERT] --
  ['i'] = {
    
    -- Exit Insert Mode --
    ['jj']          =   '<ESC>',

  },

  -- [VISUAL] --
  ['v'] = {

    -- Stay in Visual Mode while Indenting --
    ['<']           =   '<gv',
    ['>']           =   '>gv',

    -- Move Text Up and Down --
    ['<A-K>']       =   ':m .-2<CR>==',     -- Move Text Down
    ['<A-J>']       =   ':m .+1<CR>==',     -- Move Text Up

  },

  -- [VISUAL BLOCK] --
  ['x'] = {

    -- Move Text Up and Down --
    ['<A-K>']       =   ":m '<-2<CR>gv-gv",     -- Move Text Down
    ['<A-J>']       =   ":m '>+1<CR>gv-gv",     -- Move Text Up

  },

}

-- Iterate Through the Keybindings
for mode, keybinds in pairs(keybindings) do
  for lhs, rhs in pairs(keybinds) do
    map(mode, lhs, rhs, opts)
  end
end
